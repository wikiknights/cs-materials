#!/bin/bash
# Created by Jerrett Longworth

# Generates all HTML output from the project. Each Markdown file within the project's
# source directory is converted one-to-one into HTML files. The directory structure
# from the source directory is mirrored in the HTML output directory.
#
# By default, the output directory is set to `out/` within the project's root folder,
# but can be overridden using the $OUTPUT_DIR environment variable.

# Setup variables
GREY='\033[1;30m'
RESET='\033[0m'
SCRIPT_LOCATION=$(readlink -e "$0")
SCRIPT_LOCATION=${SCRIPT_LOCATION%/*}
IFS='
'

CONVERT_SCRIPT=$(readlink -e "$SCRIPT_LOCATION/md_to_html.sh")
INPUT_DIR="$SCRIPT_LOCATION/../src/"
# Set output directory if not set using environment variable
OUTPUT_DIR="${OUTPUT_DIR:-$SCRIPT_LOCATION/../out/}"


show_usage() {
	cat << EOF
Usage: ${0##*/} [-csv]
Builds all markdown files.

Options:
  -c      Only build files that have been changed since the last build.
  -s      Suppress all output from secondary build script.
  -v      Show all logs.
EOF
}


# Test for command line options
changed=0
suppress=0
verbose=0
OPTIND=1
while getopts csv option; do
	case $option in
    c)
      changed=1
      ;;
    s)
      suppress=1
      ;;
    v)
      verbose=1
      ;;
    *)
      echo "Error: Unknown argument."
      show_usage
      exit -1
  esac
done
shift "$((OPTIND-1))"

# Read the list of all markdown files to process
if [ $changed -eq 1 ]; then
# Get all changed files in the src/ directory, then remove the "src/" from the path
  files=$(git diff --name-only 2>/dev/null | grep -E '^src/' | sed -e 's#^src/##')
else
  files=$(find ${INPUT_DIR} -type f -name "*.md" -printf "%P\n")
fi

total=$(echo "$files" | wc -l)


# Build each file
i=1
for file in $files; do
  # Split the file into its path and filename components
  if [[ "$file" == *"/"* ]]; then
    filepath="${file%/*}"
  else
    # Handle the special case where a file is on the root directory
    filepath=""
  fi
  filename="${file##*/}"

  # Set the output file
  output_file="$OUTPUT_DIR$filepath/${filename%%.md}.html"

  echo " -> [$i/$total] $file"

  mkdir -p "$OUTPUT_DIR$filepath"

  # Temporarily enter the directory the file is in for relative-path links
  pushd "$INPUT_DIR$filepath" 2>/dev/null > /dev/null
  echo -en "$GREY"

  # Build the HTML file based on the command line arguments
  if [ $suppress -eq 1 ]; then
    # Suppress all output.
    "$CONVERT_SCRIPT" -h -o "$output_file" "$INPUT_DIR$file" 2>/dev/null > /dev/null
  elif [ $verbose -eq 1 ]; then
    # Show all output.
    "$CONVERT_SCRIPT" -h -o "$output_file" "$INPUT_DIR$file"
  else
    # Only show warnings and errors.
    "$CONVERT_SCRIPT" -h -o "$output_file" "$INPUT_DIR$file" > /dev/null
  fi

  # Restore the working directory
  echo -en "$RESET"
  popd 2>/dev/null > /dev/null

  i=$((i + 1))
done
