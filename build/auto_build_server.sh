#!/bin/bash

# This script will check for changes in .md files and update the output .html files
# at a set interval. A small web server is hosted at localhost for viewing the
# resulting .html files.

SCRIPT_LOCATION=$(readlink -e "$0")
SCRIPT_LOCATION=${SCRIPT_LOCATION%/*}
# Set output directory if not set using environment variables
OUTPUT_DIR="${OUTPUT_DIR:-$SCRIPT_LOCATION/../out/}"

# Frequency to check for changes in files.
FREQUENCY_SEC=5

if [ -z ${SERVER_PORT} ]; then
  echo "The \$SERVER_PORT environment variable is undefined. Quitting."
  exit 1
fi

# Execute the terminate() function on Ctrl+C
trap terminate SIGINT
terminate() {
  kill $python_pid
  exit
}

python3 -m http.server $SERVER_PORT -d "$OUTPUT_DIR" &
python_pid=$!

echo "Server is now running. Press Ctrl+C to stop."

while true; do
  echo "[`date --iso-8601=seconds`] Checking for file updates."
  "$SCRIPT_LOCATION/build_all.sh" -c
  echo "[`date --iso-8601=seconds`] Finished checking for file updates."
  sleep $FREQUENCY_SEC
done

