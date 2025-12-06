#!/usr/bin/env python3
"""
Generate index.html files for all directories in the current folder structure.
This script creates directory listings similar to Apache's DirectoryIndex.
"""

import os
import json
from pathlib import Path
from datetime import datetime


HTML_TEMPLATE = """<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Index of {relative_path}</title>
    <style>
        body {{
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            background-color: #f5f5f5;
        }}
        h1 {{
            color: #333;
            border-bottom: 2px solid #4CAF50;
            padding-bottom: 10px;
        }}
        .container {{
            background-color: white;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }}
        table {{
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }}
        th {{
            background-color: #4CAF50;
            color: white;
            text-align: left;
            padding: 12px;
            font-weight: 600;
        }}
        td {{
            padding: 10px 12px;
            border-bottom: 1px solid #ddd;
        }}
        tr:hover {{
            background-color: #f5f5f5;
        }}
        a {{
            color: #1976D2;
            text-decoration: none;
        }}
        a:hover {{
            text-decoration: underline;
        }}
        .folder {{
            font-weight: 500;
        }}
        .folder::before {{
            content: "📁 ";
        }}
        .file::before {{
            content: "📄 ";
        }}
        .parent::before {{
            content: "⬆️ ";
        }}
        .size {{
            text-align: right;
            color: #666;
        }}
        .date {{
            color: #666;
        }}
        footer {{
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid #ddd;
            color: #666;
            font-size: 0.9em;
            text-align: center;
        }}
        .search-container {{
            margin: 20px 0;
            padding: 15px;
            background-color: #f9f9f9;
            border-radius: 6px;
            border: 1px solid #ddd;
        }}
        .search-box {{
            width: 100%;
            padding: 12px 15px;
            font-size: 16px;
            border: 2px solid #4CAF50;
            border-radius: 4px;
            box-sizing: border-box;
            transition: border-color 0.3s;
        }}
        .search-box:focus {{
            outline: none;
            border-color: #45a049;
        }}
        .search-info {{
            margin-top: 10px;
            color: #666;
            font-size: 0.9em;
        }}
    </style>
</head>
<body>
    <div class="container">
        <h1>Index of {relative_path}</h1>
        {search_box}
        <table>
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Size</th>
                    <th>Last Modified</th>
                </tr>
            </thead>
            <tbody>
{table_rows}
            </tbody>
        </table>
        <footer>
            Generated on {generated_time}
        </footer>
    </div>
    {search_script}
</body>
</html>
"""


def format_size(size_bytes):
    """Format file size in human-readable format."""
    for unit in ['B', 'KB', 'MB', 'GB']:
        if size_bytes < 1024.0:
            return f"{size_bytes:.1f} {unit}"
        size_bytes /= 1024.0
    return f"{size_bytes:.1f} TB"


def get_file_info(file_path):
    """Get file size and modification time."""
    try:
        stat = file_path.stat()
        size = format_size(stat.st_size)
        mtime = datetime.fromtimestamp(stat.st_mtime).strftime('%Y-%m-%d %H:%M')
        return size, mtime
    except:
        return '-', '-'


def create_index_html(directory_path, root_path):
    """Create an index.html file for the given directory."""
    directory = Path(directory_path)
    root = Path(root_path)

    # Calculate relative path from root
    try:
        relative_path = '/' + str(directory.relative_to(root))
        if relative_path == '/.':
            relative_path = '/'
    except:
        relative_path = '/'

    # Check if this is the root directory
    is_root = (directory == root)

    # Collect directories and files
    items = []

    # Add parent directory link if not at root
    if directory != root:
        parent_link = '../index.html'
        items.append(('parent', '..', parent_link, '-', '-'))

    # List all items in directory
    try:
        dir_contents = sorted(directory.iterdir(), key=lambda x: (not x.is_dir(), x.name.lower()))

        for item in dir_contents:
            # Skip the index.html file itself and hidden files
            if item.name == 'index.html' or item.name.startswith('.'):
                continue

            if item.is_dir():
                # Directory - link to its index.html
                link = f"{item.name}/index.html"
                items.append(('folder', item.name, link, '-', '-'))
            elif item.is_file():
                # File - link directly to it
                size, mtime = get_file_info(item)
                items.append(('file', item.name, item.name, size, mtime))
    except PermissionError:
        pass

    # Generate table rows
    table_rows = []
    for item_type, name, link, size, mtime in items:
        css_class = item_type
        row = f"""                <tr>
                    <td><a href="{link}" class="{css_class}">{name}</a></td>
                    <td class="size">{size}</td>
                    <td class="date">{mtime}</td>
                </tr>"""
        table_rows.append(row)

    # Add search box and script only for root directory
    if is_root:
        search_box = """
        <div class="search-container">
            <input type="text" id="searchBox" class="search-box" placeholder="Søk etter filer i alle mapper (f.eks. NCP, round 15, COVID-19, NFP...)">
            <div class="search-info" id="searchInfo">Viser alle filer i denne mappen</div>
        </div>"""

        search_script = """
    <script>
        const searchBox = document.getElementById('searchBox');
        const searchInfo = document.getElementById('searchInfo');
        const tableBody = document.querySelector('tbody');
        const originalRows = Array.from(document.querySelectorAll('tbody tr'));
        let allFiles = [];

        // Load the comprehensive file index
        fetch('files_index.json')
            .then(response => response.json())
            .then(data => {
                allFiles = data;
                searchInfo.textContent = `Klar til å søke i ${allFiles.length} filer fra alle mapper`;
            })
            .catch(error => {
                console.error('Error loading file index:', error);
                searchInfo.textContent = 'Søk er begrenset til denne mappen (kunne ikke laste filindeks)';
            });

        searchBox.addEventListener('input', function() {
            const searchTerm = this.value.toLowerCase().trim();

            if (searchTerm === '') {
                // Show original rows when search is empty
                tableBody.innerHTML = '';
                originalRows.forEach(row => tableBody.appendChild(row.cloneNode(true)));
                searchInfo.textContent = `Klar til å søke i ${allFiles.length} filer fra alle mapper`;
                return;
            }

            // Search through all files
            const matchingFiles = allFiles.filter(file => {
                const fileName = file.name.toLowerCase();
                const filePath = file.path.toLowerCase();
                return fileName.includes(searchTerm) || filePath.includes(searchTerm);
            });

            // Clear table and show matching files
            tableBody.innerHTML = '';

            if (matchingFiles.length === 0) {
                const row = document.createElement('tr');
                row.innerHTML = `<td colspan="3" style="text-align: center; color: #999;">Ingen filer matcher "${searchTerm}"</td>`;
                tableBody.appendChild(row);
                searchInfo.textContent = `Ingen treff`;
            } else {
                matchingFiles.forEach(file => {
                    const row = document.createElement('tr');
                    const directoryLabel = file.directory === '/' ? 'rot' : file.directory;
                    row.innerHTML = `
                        <td><a href="${file.path}" class="file">${file.name}</a><br><small style="color: #999; margin-left: 24px;">📁 ${directoryLabel}</small></td>
                        <td class="size">${file.size}</td>
                        <td class="date">${file.modified}</td>
                    `;
                    tableBody.appendChild(row);
                });
                searchInfo.textContent = `Viser ${matchingFiles.length} av ${allFiles.length} filer`;
            }
        });
    </script>"""
    else:
        search_box = ''
        search_script = ''

    # Generate HTML content
    html_content = HTML_TEMPLATE.format(
        relative_path=relative_path,
        search_box=search_box,
        table_rows='\n'.join(table_rows),
        generated_time=datetime.now().strftime('%Y-%m-%d %H:%M:%S'),
        search_script=search_script
    )

    # Write index.html file
    index_file = directory / 'index.html'
    with open(index_file, 'w', encoding='utf-8') as f:
        f.write(html_content)

    print(f"Created: {index_file}")


def collect_all_files(root_path):
    """Collect all HTML files from all subdirectories."""
    all_files = []

    for dirpath, dirnames, filenames in os.walk(root_path):
        # Skip hidden directories
        dirnames[:] = [d for d in dirnames if not d.startswith('.')]

        dir_path = Path(dirpath)

        # Calculate relative directory path
        try:
            if dir_path == root_path:
                rel_dir = ''
            else:
                rel_dir = str(dir_path.relative_to(root_path)) + '/'
        except:
            continue

        for filename in filenames:
            # Skip index.html files, hidden files, and non-HTML files
            if filename == 'index.html' or filename.startswith('.') or not filename.endswith('.html'):
                continue

            file_path = dir_path / filename
            size, mtime = get_file_info(file_path)

            all_files.append({
                'name': filename,
                'path': rel_dir + filename,
                'directory': rel_dir.rstrip('/') if rel_dir else '/',
                'size': size,
                'modified': mtime
            })

    return all_files


def main():
    """Generate index.html files for all directories."""
    root_path = Path.cwd()

    print(f"Generating index.html files for: {root_path}\n")

    # Create index for root directory
    create_index_html(root_path, root_path)

    # Walk through all subdirectories
    for dirpath, dirnames, filenames in os.walk(root_path):
        # Skip hidden directories
        dirnames[:] = [d for d in dirnames if not d.startswith('.')]

        dir_path = Path(dirpath)

        # Skip root (already processed)
        if dir_path == root_path:
            continue

        create_index_html(dir_path, root_path)

    # Generate comprehensive file index JSON
    print("\nGenerating files index JSON...")
    all_files = collect_all_files(root_path)
    json_file = root_path / 'files_index.json'

    with open(json_file, 'w', encoding='utf-8') as f:
        json.dump(all_files, f, ensure_ascii=False, indent=2)

    print(f"Created: {json_file} ({len(all_files)} files indexed)")

    print("\nDone! All index.html files have been generated.")
    print("You can now commit and push these files to GitHub.")


if __name__ == '__main__':
    main()
