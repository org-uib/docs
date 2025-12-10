#!/usr/bin/env python3
"""Create a word cloud image from pre-calculated frequencies."""

from wordcloud import WordCloud
import matplotlib.pyplot as plt

# Word frequencies from our analysis
word_frequencies = {
    'dei': 113,
    'enig': 54,
    'generasjon': 50,
    'svært': 49,
    'eldre': 47,
    'yngre': 46,
    'uenig': 42,
    'ein': 39,
    'signifikant': 37,
    'data': 35,
    'frå': 35,
    'utdanning': 35,
    'stemme': 33,
    'kjønn': 28,
    'region': 26,
    'inntekt': 26,
    'enn': 25,
    'blant': 21,
    'vekst': 20,
    'bekymret': 18
}

print("Creating word cloud image...")

# Create word cloud from frequencies
wordcloud = WordCloud(
    width=1920,
    height=1080,
    background_color='white',
    max_words=20,
    relative_scaling=0.5,
    colormap='viridis',
    min_font_size=20,
    prefer_horizontal=0.7,
    font_path='/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf'
).generate_from_frequencies(word_frequencies)

# Create figure
plt.figure(figsize=(19.2, 10.8), dpi=100)
plt.imshow(wordcloud, interpolation='bilinear')
plt.axis('off')
plt.tight_layout(pad=0)

# Save the image
output_file = 'wordcloud.png'
plt.savefig(output_file, dpi=100, bbox_inches='tight', pad_inches=0, facecolor='white')
print(f"Word cloud saved to: {output_file}")

# Also save a higher resolution version
output_file_hd = 'wordcloud_hd.png'
plt.savefig(output_file_hd, dpi=150, bbox_inches='tight', pad_inches=0, facecolor='white')
print(f"High resolution version saved to: {output_file_hd}")

print("\nDone!")
