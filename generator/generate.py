import csv
import random
import os
import sys

NUM_ROWS = 50


COLUMNS = ["product", "size", "color", "price"]

def generate_row():
    product =  ["T-shirt", "Jeans", "Jacket", "Dress", "Sweater", "Skirt"]
    size = ["XS", "S", "M", "L", "XL", "XXL"]
    color = ["Red", "Blue", "Black", "White", "Green", "Yellow"]
    return {
        "product": random.choice(product),
        "size": random.choice(size),
        "price": round(random.uniform(1000, 5000),2),
        "color": random.choice(color),
    }

OUTPUT_DIR = sys.argv[1] if len(sys.argv) > 1 else "/data"
OUTPUT_FILE = os.path.join(OUTPUT_DIR, "data.csv")

os.makedirs(OUTPUT_DIR, exist_ok=True)

rows = [generate_row() for _ in range(NUM_ROWS)]

with open(OUTPUT_FILE, "w", newline="", encoding="utf-8") as f:
    writer = csv.DictWriter(f, fieldnames=COLUMNS)
    writer.writeheader()
    writer.writerows(rows)
