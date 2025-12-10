import os
import re
from bs4 import BeautifulSoup
from collections import Counter

HTML_DIR = "/home/helge/HELGES-LOKALE-RAIL-KUBERNETES-REPO/uib-org/docs/medborgernotat/kodeboker/"  # Folder containing HTML files
IGNORE_WORDS = {
    "og", "i", "er", "ikke", "nesten", "ofte", "av", "til", "som", "for", "det",
    "en", "et", "på", "med", "de", "at", "har", "hadde", "men", "eller", "bare",
    "fra", "så", "kan", "om", "man", "vi", "du", "jeg", "hun", "han", "der",
    "dette", "den", "dets", "var"
}  # Extend this freely

word_counter = Counter()

for filename in os.listdir(HTML_DIR):
    if filename.endswith(".html"):
        file_path = os.path.join(HTML_DIR, filename)
        with open(file_path, "r", encoding="utf-8") as file:
            soup = BeautifulSoup(file.read(), "html.parser")
            text = soup.get_text()

            # Normalize | lowercase | remove punctuation
            cleaned = re.sub(r"[^a-zA-ZæøåÆØÅ ]+", " ", text).lower()

            words = cleaned.split()

            # Filter out "stopwords" and short words
            words = [w for w in words if w not in IGNORE_WORDS and len(w) > 2]

            word_counter.update(words)

print("\nMost Common Words:\n")
for word, count in word_counter.most_common(50):  # top 50
    print(f"{word}: {count}")
