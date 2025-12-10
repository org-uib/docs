#!/usr/bin/env python3
"""Generate a word cloud from all HTML content in the directory."""

import glob
from pathlib import Path
from bs4 import BeautifulSoup
from wordcloud import WordCloud
import matplotlib.pyplot as plt
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
    'vors', 'hvis', 'både', 'bare', 'enn', 'fordi', 'før', 'mange', 'også', 'slik',
    'vært', 'være', 'båe', 'begge', 'siden', 'dykk', 'dykkar', 'dei', 'deira', 'deires',
    'deim', 'di', 'då', 'eg', 'ein', 'eit', 'eitt', 'elles', 'honom', 'hjå', 'ho',
    'hoe', 'henne', 'hennar', 'hennes', 'hoss', 'hossen', 'ikkje', 'ingi', 'inkje',
    'korleis', 'korso', 'kva', 'kvar', 'kvarhelst', 'kven', 'kvi', 'kvifor',
    # English stop words (since there might be some English content)
    'the', 'be', 'to', 'of', 'and', 'a', 'in', 'that', 'have', 'i', 'it', 'for',
    'not', 'on', 'with', 'he', 'as', 'you', 'do', 'this', 'but', 'his', 'by',
    'from', 'they', 'we', 'say', 'her', 'she', 'or', 'an', 'will', 'my', 'one',
    'all', 'would', 'there', 'their', 'what', 'so', 'up', 'out', 'if', 'about',
    'who', 'get', 'which', 'go', 'me', 'when', 'make', 'can', 'like', 'time',
    'no', 'just', 'him', 'know', 'take', 'people', 'into', 'year', 'your', 'good',
    'some', 'could', 'them', 'see', 'other', 'than', 'then', 'now', 'look', 'only',
    'come', 'its', 'over', 'think', 'also', 'back', 'after', 'use', 'two', 'how',
    'our', 'work', 'first', 'well', 'way', 'even', 'new', 'want', 'because', 'any',
    'these', 'give', 'day', 'most', 'us', 'is', 'was', 'are', 'been', 'has', 'had',
    'were', 'said', 'did', 'having', 'may', 'such', 'being', 'does', 'done', 'nbsp'
}

def extract_text_from_html(file_path):
    """Extract text content from an HTML file."""
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            soup = BeautifulSoup(f.read(), 'html.parser')

            # Remove script and style elements
            for script in soup(["script", "style"]):
                script.decompose()

            # Get text
            text = soup.get_text()

            # Clean up whitespace
            lines = (line.strip() for line in text.splitlines())
            chunks = (phrase.strip() for line in lines for phrase in line.split("  "))
            text = ' '.join(chunk for chunk in chunks if chunk)

            return text
    except Exception as e:
        print(f"Error reading {file_path}: {e}")
        return ""

def main():
    # Find all HTML files
    html_files = glob.glob("**/*.html", recursive=True)

    print(f"Found {len(html_files)} HTML files")

    # Extract text from all files
    all_text = ""
    for html_file in html_files:
        print(f"Processing: {html_file}")
        text = extract_text_from_html(html_file)
        all_text += " " + text

    print(f"\nTotal text length: {len(all_text)} characters")

    # Generate word cloud
    print("\nGenerating word cloud...")

    # Try to find a suitable font, fall back to default
    font_path = None
    possible_fonts = [
        '/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf',
        '/usr/share/fonts/truetype/liberation/LiberationSans-Regular.ttf',
        '/System/Library/Fonts/Helvetica.ttc',
        'C:\\Windows\\Fonts\\Arial.ttf'
    ]
    for font in possible_fonts:
        if Path(font).exists():
            font_path = font
            break

    wordcloud = WordCloud(
        width=1920,
        height=1080,
        background_color='white',
        stopwords=NORWEGIAN_STOP_WORDS,
        max_words=200,
        relative_scaling=0.5,
        colormap='viridis',
        min_font_size=10,
        prefer_horizontal=0.7,
        font_path=font_path
    ).generate(all_text)

    # Create figure
    plt.figure(figsize=(19.2, 10.8), dpi=100)
    plt.imshow(wordcloud, interpolation='bilinear')
    plt.axis('off')
    plt.tight_layout(pad=0)

    # Save the image
    output_file = 'wordcloud.png'
    plt.savefig(output_file, dpi=100, bbox_inches='tight', pad_inches=0)
    print(f"\nWord cloud saved to: {output_file}")

    # Also save a higher resolution version
    output_file_hd = 'wordcloud_hd.png'
    plt.savefig(output_file_hd, dpi=150, bbox_inches='tight', pad_inches=0)
    print(f"High resolution version saved to: {output_file_hd}")

if __name__ == "__main__":
    main()
