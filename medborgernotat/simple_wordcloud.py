#!/usr/bin/env python3
"""Generate a simple word cloud from a sample of HTML files."""

import glob
from pathlib import Path
from bs4 import BeautifulSoup
from collections import Counter
import re

# Norwegian stop words (common words to exclude)
NORWEGIAN_STOP_WORDS = {
    'og', 'i', 'jeg', 'det', 'at', 'en', 'et', 'den', 'til', 'er', 'som', 'på',
    'de', 'med', 'han', 'av', 'ikke', 'ikkje', 'der', 'så', 'var', 'meg', 'seg',
    'men', 'ett', 'har', 'om', 'vi', 'min', 'mitt', 'ha', 'hadde', 'hun', 'nå',
    'over', 'da', 'ved', 'fra', 'du', 'ut', 'sin', 'dem', 'oss', 'opp', 'man',
    'kan', 'hans', 'hvor', 'eller', 'hva', 'skal', 'selv', 'sjøl', 'her', 'alle',
    'vil', 'bli', 'ble', 'blei', 'blitt', 'kunne', 'inn', 'når', 'være', 'kom',
    'noen', 'noe', 'ville', 'dere', 'som', 'deres', 'kun', 'ja', 'etter', 'ned',
    'skulle', 'denne', 'for', 'deg', 'si', 'sine', 'sitt', 'mot', 'å', 'meget',
    'hvorfor', 'dette', 'disse', 'uten', 'hvordan', 'ingen', 'din', 'ditt', 'blir',
    'samme', 'hvilken', 'hvilke', 'sånn', 'inni', 'mellom', 'vår', 'hver', 'hvem',
    'the', 'be', 'to', 'of', 'and', 'a', 'in', 'that', 'have', 'it', 'for',
    'not', 'on', 'with', 'he', 'as', 'you', 'do', 'this', 'but', 'his', 'by',
    'from', 'they', 'we', 'say', 'her', 'she', 'or', 'an', 'will', 'my', 'one',
    'all', 'would', 'there', 'their', 'what', 'so', 'up', 'out', 'if', 'about',
    'who', 'get', 'which', 'go', 'me', 'when', 'make', 'can', 'like', 'time',
    'no', 'just', 'him', 'know', 'take', 'people', 'into', 'year', 'your', 'good',
    'some', 'could', 'them', 'see', 'other', 'than', 'then', 'now', 'look', 'only',
    'nbsp', 'var', 'null', 'true', 'false', 'function', 'return', 'html', 'div', 'class'
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

def get_words(text):
    """Extract words from text, filtering out stop words and short words."""
    words = re.findall(r'\b[a-zA-ZæøåÆØÅ]{3,}\b', text.lower())
    return [w for w in words if w not in NORWEGIAN_STOP_WORDS]

def main():
    # Find HTML files (excluding subdirectories for simplicity)
    html_files = [f for f in glob.glob("*.html") if Path(f).is_file()]

    if not html_files:
        print("No HTML files found!")
        return

    print(f"Found {len(html_files)} HTML files in current directory")

    # Step 1: Get top 20 words from first file
    first_file = html_files[0]
    print(f"\nStep 1: Analyzing first file: {first_file}")
    first_text = extract_text_from_html(first_file)
    first_words = get_words(first_text)
    word_counts = Counter(first_words)
    top_20_words = [word for word, count in word_counts.most_common(20)]

    print(f"Top 20 words from first file:")
    for i, word in enumerate(top_20_words, 1):
        print(f"  {i}. {word}")

    # Step 2: Count these words across ~30 files
    sample_size = min(30, len(html_files))
    sample_files = html_files[:sample_size]

    print(f"\nStep 2: Counting across {sample_size} files...")

    total_counts = Counter()
    for i, file in enumerate(sample_files, 1):
        print(f"  Processing {i}/{sample_size}: {file}")
        text = extract_text_from_html(file)
        words = get_words(text)
        # Only count the top 20 words
        for word in words:
            if word in top_20_words:
                total_counts[word] += 1

    print(f"\nFinal word counts:")
    for word, count in total_counts.most_common():
        print(f"  {word}: {count}")

    # Step 3: Create a simple ASCII art word cloud
    print(f"\n{'='*60}")
    print("SIMPLE TEXT-BASED WORD CLOUD")
    print(f"{'='*60}\n")

    max_count = max(total_counts.values())
    for word, count in total_counts.most_common():
        # Scale the word repetition based on frequency
        size = int((count / max_count) * 5) + 1
        print(f"{word.upper()} " * size)

    print(f"\n{'='*60}")

    # Save to a simple text file
    with open('wordcloud_simple.txt', 'w') as f:
        f.write("WORD CLOUD - Top words and their frequencies\n")
        f.write("="*60 + "\n\n")
        for word, count in total_counts.most_common():
            f.write(f"{word}: {count}\n")

    print(f"\nWord cloud data saved to: wordcloud_simple.txt")

if __name__ == "__main__":
    main()
