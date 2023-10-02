#!/bin/bash
# Created by Bed Pandey
# Optimization sprinkles by Jerrett Longworth

# Print list of modified .md files by comparing their UNIX timestamps against their respective .html file

SCRIPT_LOCATION=$(readlink -e "$0")
SCRIPT_LOCATION=${SCRIPT_LOCATION%/*}

INPUT_DIR="$SCRIPT_LOCATION/../src/"
# Set output directory if not set using environment variables
OUTPUT_DIR="${OUTPUT_DIR:-$SCRIPT_LOCATION/../out/}"
# OUTPUT_DIR="$SCRIPT_LOCATION/../out/"

# Loop over all .md files within the project location.
find "$INPUT_DIR" -name '*.md' -printf "%P %Ts\n" | while read -r md_path md_date; do
	# Replace .md extension with .html
	html_path="${md_path%%.md}.html"

	# Get timestamp of .html
	html_date=$(date -r "$OUTPUT_DIR/$html_path" +%s 2>/dev/null)

	# If the .html file doesn't exist or the .md file is newer than the .html file, print it out
	if [[ $? != 0 || $md_date -ge $html_date ]]; then
		echo "$md_path"
	fi
done
