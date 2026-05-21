#!/usr/bin/env bash

set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

QUALITY=85
WIDTH=756

shopt -s nullglob nocaseglob

for file in "$DIR"/*.jpg "$DIR"/*.JPG; do
    [ -f "$file" ] || continue

    tmp="${file}.tmp"

    convert "$file" -resize "${WIDTH}x" -quality "$QUALITY" "$tmp"

    mv -f "$tmp" "$file"

    echo "Updated: $file"
done