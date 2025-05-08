#!/bin/bash

# File: extract_nav.sh
# Description: Extract Scheme Name and NAV from AMFI and save as TSV and JSON

# Download the AMFI NAV data
curl -s "https://www.amfiindia.com/spages/NAVAll.txt" -o NAVAll.txt

# TSV Output
tsv_output="amfi_schemes.tsv"

# Extract Scheme Name and NAV using AWK, skipping headers
awk -F ';' 'NF >= 5 && $1 ~ /^[0-9]+$/ { print $4 "\t" $5 }' NAVAll.txt > "$tsv_output"

echo "✅ TSV output saved to $tsv_output"

# Optional: Create JSON output if jq is installed
json_output="amfi_schemes.json"

if command -v jq &> /dev/null; then
    echo "Creating JSON output..."
    awk -F ';' 'NF >= 5 && $1 ~ /^[0-9]+$/ { gsub(/"/, "", $4); gsub(/"/, "", $5); print "{\"Scheme Name\": \"" $4 "\", \"NAV\": \"" $5 "\"}," }' NAVAll.txt |
    sed '$ s/,$//' |  # Remove trailing comma from last line
    awk 'BEGIN { print "[" } { print } END { print "]" }' > "$json_output"

    echo "✅ JSON output saved to $json_output"
else
    echo "⚠️ 'jq' not found. JSON output skipped."
fi
