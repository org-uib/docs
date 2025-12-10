#!/usr/bin/env python3
"""Generate a word cloud from scientific/topic-specific words only."""

import glob
from pathlib import Path
from bs4 import BeautifulSoup
from collections import Counter
import re

# Expanded Norwegian and English stop words + common words
STOP_WORDS = {
    # Norwegian common words
    'og', 'i', 'jeg', 'det', 'at', 'en', 'et', 'den', 'til', 'er', 'som', 'på',
    'de', 'med', 'han', 'av', 'ikke', 'ikkje', 'der', 'så', 'var', 'meg', 'seg',
    'men', 'ett', 'har', 'om', 'vi', 'min', 'mitt', 'ha', 'hadde', 'hun', 'nå',
    'over', 'da', 'ved', 'fra', 'frå', 'du', 'ut', 'sin', 'dem', 'oss', 'opp', 'man',
    'kan', 'hans', 'hvor', 'eller', 'hva', 'skal', 'selv', 'sjøl', 'her', 'alle',
    'vil', 'bli', 'ble', 'blei', 'blitt', 'kunne', 'inn', 'når', 'være', 'kom',
    'noen', 'noe', 'ville', 'dere', 'som', 'deres', 'kun', 'ja', 'etter', 'ned',
    'skulle', 'denne', 'for', 'deg', 'si', 'sine', 'sitt', 'mot', 'å', 'meget',
    'hvorfor', 'dette', 'disse', 'uten', 'hvordan', 'ingen', 'din', 'ditt', 'blir',
    'samme', 'hvilken', 'hvilke', 'sånn', 'inni', 'mellom', 'vår', 'hver', 'hvem',
    'dei', 'ein', 'enn', 'svært', 'blant', 'også', 'også', 'mer', 'mindre', 'eit',
    'under', 'før', 'gjennom', 'mellom', 'rundt', 'hele', 'både', 'fram', 'tilbake',
    'andre', 'første', 'andre', 'tredje', 'hver', 'annen', 'anna', 'andre',
    # English common words
    'the', 'be', 'to', 'of', 'and', 'a', 'in', 'that', 'have', 'it', 'for',
    'not', 'on', 'with', 'he', 'as', 'you', 'do', 'this', 'but', 'his', 'by',
    'from', 'they', 'we', 'say', 'her', 'she', 'or', 'an', 'will', 'my', 'one',
    'all', 'would', 'there', 'their', 'what', 'so', 'up', 'out', 'if', 'about',
    'who', 'get', 'which', 'go', 'me', 'when', 'make', 'can', 'like', 'time',
    'no', 'just', 'him', 'know', 'take', 'people', 'into', 'year', 'your', 'good',
    'some', 'could', 'them', 'see', 'other', 'than', 'then', 'now', 'look', 'only',
    # Technical/common words to exclude
    'nbsp', 'var', 'null', 'true', 'false', 'function', 'return', 'html', 'div', 'class',
    'data', 'table', 'value', 'row', 'column', 'index', 'type', 'name', 'number',
    # Very common research words to exclude
    'signifikant', 'prosent', 'percent', 'respondent', 'respondenter', 'spørsmål',
    'svar', 'tabell', 'figur', 'kilde', 'side', 'gruppe', 'grupper'
}

def extract_text_from_html(file_path):
    """Extract text content from an HTML file."""
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            soup = BeautifulSoup(f.read(), 'html.parser')
            for script in soup(["script", "style"]):
                script.decompose()
            text = soup.get_text()
            lines = (line.strip() for line in text.splitlines())
            chunks = (phrase.strip() for line in lines for phrase in line.split("  "))
            text = ' '.join(chunk for chunk in chunks if chunk)
            return text
    except Exception as e:
        print(f"Error reading {file_path}: {e}")
        return ""

def get_meaningful_words(text):
    """Extract meaningful words - longer words that aren't stop words."""
    # Look for words with at least 5 characters to get more meaningful terms
    words = re.findall(r'\b[a-zA-ZæøåÆØÅ]{5,}\b', text.lower())
    return [w for w in words if w not in STOP_WORDS]

def main():
    # Find HTML files (excluding subdirectories for simplicity)
    html_files = [f for f in glob.glob("*.html") if Path(f).is_file()]

    if not html_files:
        print("No HTML files found!")
        return

    print(f"Found {len(html_files)} HTML files in current directory")

    # Step 1: Get top 30 meaningful words from first file
    first_file = html_files[0]
    print(f"\nStep 1: Analyzing first file for scientific/topic words: {first_file}")
    first_text = extract_text_from_html(first_file)
    first_words = get_meaningful_words(first_text)
    word_counts = Counter(first_words)
    top_30_words = [word for word, count in word_counts.most_common(30)]

    print(f"\nTop 30 meaningful words from first file:")
    for i, word in enumerate(top_30_words, 1):
        print(f"  {i}. {word} ({word_counts[word]})")

    # Step 2: Count document frequency (how many files contain each word)
    sample_size = min(30, len(html_files))
    sample_files = html_files[:sample_size]

    print(f"\nStep 2: Counting document frequency across {sample_size} files...")

    total_counts = Counter()
    for i, file in enumerate(sample_files, 1):
        print(f"  Processing {i}/{sample_size}: {file}")
        text = extract_text_from_html(file)
        words = get_meaningful_words(text)
        # Get unique words in this document (count each word once per file)
        unique_words_in_doc = set(words)
        for word in unique_words_in_doc:
            if word in top_30_words:
                total_counts[word] += 1

    print(f"\nFinal word counts:")
    top_20 = total_counts.most_common(20)
    for word, count in top_20:
        print(f"  {word}: {count}")

    # Step 3: Create HTML word cloud
    print(f"\nCreating HTML word cloud...")

    # Build word data JSON
    word_data_js = ',\n            '.join([f"{{ word: '{word}', count: {count} }}" for word, count in top_20])

    html_content = f"""<!DOCTYPE html>
<html lang="no">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Medborgernotat - Tematisk Ordsky</title>
    <style>
        body {{
            margin: 0;
            padding: 20px;
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }}
        .container {{
            background: white;
            border-radius: 20px;
            padding: 40px;
            box-shadow: 0 20px 60px rgba(0,0,0,0.3);
            max-width: 1400px;
            width: 100%;
        }}
        h1 {{
            text-align: center;
            color: #333;
            margin-bottom: 10px;
            font-size: 2.5em;
        }}
        h2 {{
            text-align: center;
            color: #666;
            margin-bottom: 40px;
            font-size: 1.2em;
            font-weight: normal;
        }}
        .word-cloud {{
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items: center;
            gap: 15px;
            padding: 20px;
            min-height: 500px;
        }}
        .word {{
            display: inline-block;
            padding: 10px 20px;
            border-radius: 8px;
            transition: all 0.3s ease;
            cursor: pointer;
            font-weight: bold;
        }}
        .word:hover {{
            transform: scale(1.15) rotate(3deg);
            box-shadow: 0 8px 20px rgba(0,0,0,0.3);
        }}
        .legend {{
            text-align: center;
            margin-top: 30px;
            color: #666;
            font-size: 14px;
        }}
    </style>
</head>
<body>
    <div class="container">
        <h1>Medborgernotat</h1>
        <h2>Tematisk Ordsky</h2>
        <div class="word-cloud" id="wordCloud"></div>
        <div class="legend">
            Tematiske nøkkelord fra medborgernotatene. Tallet viser hvor mange filer som inneholder ordet.
        </div>
    </div>

    <script>
        const wordData = [
            {word_data_js}
        ];

        const colors = [
            '#667eea', '#764ba2', '#f093fb', '#4facfe',
            '#43e97b', '#fa709a', '#fee140', '#30cfd0',
            '#a8edea', '#fed6e3', '#c471ed', '#12c2e9',
            '#ff6b6b', '#4ecdc4', '#45b7d1', '#96ceb4'
        ];

        const wordCloud = document.getElementById('wordCloud');
        const maxCount = Math.max(...wordData.map(w => w.count));
        const minCount = Math.min(...wordData.map(w => w.count));

        wordData.forEach((item, index) => {{
            const wordEl = document.createElement('span');
            wordEl.className = 'word';
            wordEl.textContent = item.word;
            wordEl.title = `Forekomster: ${{item.count}}`;

            // Calculate font size based on frequency (25px to 90px)
            const fontSize = 25 + ((item.count - minCount) / (maxCount - minCount)) * 65;
            wordEl.style.fontSize = fontSize + 'px';

            // Assign color
            wordEl.style.backgroundColor = colors[index % colors.length];
            wordEl.style.color = 'white';

            // Add click event to show count
            wordEl.addEventListener('click', () => {{
                alert(`"${{item.word}}" finnes i ${{item.count}} filer`);
            }});

            wordCloud.appendChild(wordEl);
        }});
    </script>
</body>
</html>"""

    with open('wordcloud_scientific.html', 'w', encoding='utf-8') as f:
        f.write(html_content)

    print(f"Scientific word cloud saved to: wordcloud_scientific.html")
    print("\nOpen wordcloud_scientific.html in your browser to view the result!")

if __name__ == "__main__":
    main()
