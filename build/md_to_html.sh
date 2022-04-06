#!/bin/bash
# Created by Idel Martinez and Jerrett Longworth

# Check if pandoc exists
if ! command -v pandoc &> /dev/null; then
	echo "Pandoc is not installed. Please install it and try again."
	exit -2
fi

# Check if python exists
if ! command -v python &> /dev/null; then
	echo "Python is not installed. Please install it and try again."
	exit -3
fi

# Check if premailer exists
if ! python -c "import premailer" &> /dev/null; then
	echo "Premailer is not installed. Please install it and try again."
	exit -4
fi

show_usage() {
	cat << EOF
Usage: ${0##*/} [-dhp] <file>
Converts a Pandoc markdown file into a variety of formats. If no format is specified,
it will be converted to all formats supported by this script.

Options:
  -d       Convert to DOCX.
  -h       Convert to HTML.
  -p       Convert to PDF.
EOF
}


convert_html() {
	echo "Converting to HTML..."
	pandoc tmp.md -o tmp.html --highlight-style tango --self-contained -V title:' ' --metadata title=' '

	echo "Fixing CSS..."
	python3 -m premailer -f tmp.html -o "$1".html
}

convert_docx() {
	echo "Converting to DOCX..."
	pandoc tmp.md -o "$1".docx --highlight-style tango
}

convert_pdf() {
	echo "Converting to PDF..."
	pandoc tmp.md -o "$1".pdf --highlight-style tango --metadata=geometry:margin=1in
}

converter() {
	convert_html "$1"
	convert_docx "$1"
	convert_pdf "$1"
}


add_line_numbers() {
	# First line: When a code block starts with "lineNumber" in it, start adding line numbers.
	# If the line begins with a space, assume it is indented and account for indentation when adding line numbers.
	# Additionally, remove "lineNumber" from the first line, as this additional word causes pandoc to misformat the code block.
	# Second line: When a code block ends, stop adding line numbers.
	# Third line: Printing. Print based on if line numbers should be added, then if indentation should be added.
	# Fourth line: Increment the line number.

	awk '/^\s*```.*lineNumber.*$/{NUMS=1; LINE=1; if (substr($0, 0, 1) ~ /\s/) {tabbed=1} else {tabbed=0}; $NF=""; print $0; next}
			 /^\s*```\s*$/{NUMS=0}
			 {if (NUMS == 1) {if (tabbed == 1) {print "\t"LINE" "$0} else {print LINE"\t"$0}} else {print $0}}
			 {LINE++}' "$1" > tmp.md
}


# Set flags for conversion modes
all=1
docx=0
html=0
pdf=0

# Test for command line options
OPTIND=1
while getopts dhp option; do
	case $option in
		d)
			docx=1
			all=0
			;;
		h)
			html=1
			all=0
			;;
		p)
			pdf=1
			all=0
			;;
	esac
done
shift "$((OPTIND-1))"

# If no file was given
if [ -z "$1" ]; then
	show_usage
	exit -1
fi

# If the file specified is not available
if [ ! -f "$1" ]; then
	echo "Error opening \"$1\"."
	exit -1
fi

echo "Adding line numbers..."
add_line_numbers "$1"
echo "Line numbers added."

echo "Converting files..."
file_no_extension="${1%.*}"
if [ $all -eq 1 ]; then
	converter "$file_no_extension"
else
	if [ $docx -eq 1 ]; then convert_docx "$file_no_extension"; fi
	if [ $html -eq 1 ]; then convert_html "$file_no_extension"; fi
	if [ $pdf  -eq 1 ]; then convert_pdf "$file_no_extension"; fi
fi
echo "Finished all converting."

echo "Cleaning up..."
rm tmp.*

echo "All done!"
