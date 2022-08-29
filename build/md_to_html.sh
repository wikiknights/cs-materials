#!/bin/bash
# Created by Idel Martinez and Jerrett Longworth

# Setup variables
SCRIPT_LOCATION=$(readlink -e "$0")
SCRIPT_LOCATION=${SCRIPT_LOCATION%/*}
ROOT_DIR="$SCRIPT_LOCATION/../"

# Check if pandoc exists
if ! command -v pandoc &> /dev/null; then
	echo "Pandoc is not installed. Please install it and try again."
	exit -2
fi

show_usage() {
	cat << EOF
Usage: ${0##*/} [-dhmp] [-o output_file] <file>
Converts a Pandoc markdown file into a variety of formats. If no format is specified,
it will be converted to all formats supported by this script.

Options:
  -d          Convert to DOCX.
  -h          Convert to HTML.
  -m          Use premailer in HTML output (disabled by default).
  -o <file>   Outputs to the specified file.
  -p          Convert to PDF.
EOF
}

# Set default flags
customout=""
enable_premailer=0

convert_html() {
	if [ -n "$customout" ]; then
		outputfile="$customout"
	else
		outputfile="$1.html"
	fi

	echo "Adjusting *.md links to *.html links..."
	perl -pi -e 's/(\(.*?\.)(md)(\))/\1html\3/g' tmp.md

	echo "Converting to HTML..."
	pandoc tmp.md -o tmp.html --highlight-style "$ROOT_DIR/templates/customhighlight.theme" --embed-resources --standalone --data-dir="$ROOT_DIR" --defaults "$ROOT_DIR/build/defaults.yaml"

	# Stop if conversion failed
	[ $? -ne 0 ] && return 1

	if [ $enable_premailer -eq 1 ]; then
		echo "Fixing CSS..."
		python3 -m premailer -f tmp.html -o tmp2.html
		mv tmp2.html tmp.html
	fi

	mv tmp.html "$outputfile"
}

convert_docx() {
	if [ -n "$customout" ]; then
		outputfile="$customout"
	else
		outputfile="$1.docx"
	fi

	echo "Converting to DOCX..."
	pandoc tmp.md -o "$outputfile" --highlight-style "$ROOT_DIR/templates/customhighlight.theme" --defaults "$ROOT_DIR/build/defaults.yaml"
}

convert_pdf() {
	if [ -n "$customout" ]; then
		outputfile="$customout"
	else
		outputfile="$1.pdf"
	fi

	echo "Converting to PDF..."
	pandoc tmp.md -o "$outputfile" --highlight-style "$ROOT_DIR/templates/customhighlight.theme" --defaults "$ROOT_DIR/build/defaults.yaml" --include-in-header "$ROOT_DIR/build/linewrap.tex"
}

converter() {
	convert_html "$1"
	convert_docx "$1"
	convert_pdf "$1"
}

# Set default flags for conversion modes
all=1
docx=0
html=0
pdf=0

# Test for command line options
OPTIND=1
while getopts dhmo:p option; do
	case $option in
		d)
			docx=1
			all=0
			;;
		h)
			html=1
			all=0
			;;
		m)
			enable_premailer=1
			;;
		o)
			customout="${OPTARG}"
			;;
		p)
			pdf=1
			all=0
			;;
		:)
			echo "Error: -${OPTARG} requires an argument."
			exit -1
			;;
		*)
			echo "Error: Unknown argument."
			show_usage
			exit -1
	esac
done
shift "$((OPTIND-1))"

# Check if python and premailer exist, if they are needed
if [ $enable_premailer -eq 1 ]; then
	# Check if python exists
	if ! command -v python &> /dev/null; then
		echo "Python is not installed. Please install it and try again."
		exit -3
	fi

	if ! python -c "import premailer" &> /dev/null; then
		echo "Premailer is not installed. Please install it and try again."
		exit -4
	fi
fi

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

cp "$1" tmp.md

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
rm -f tmp.md tmp.html

echo "All done!"
