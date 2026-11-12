#!/bin/bash
set -euo pipefail

mkdir -p "$2"
aws s3 cp "s3://$1/" "$2/" --recursive --exclude "*" --include "*.txt"
book_dir=$(realpath "$2")
echo "File path" > book_list.txt
find "$book_dir" -type f -name "*.txt" | sort >> book_list.txt
echo "Wrote $(($(wc -l < book_list.txt) - 1)) book files to book_list.txt"
