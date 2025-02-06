#!/bin/bash

DOWNLOADS="$HOME/Downloads"
ORGANIZER_SCRIPT="$HOME/.DirX.sh"
LOGFILE="$DOWNLOADS/organizer.log"

echo "Monitoring $DOWNLOADS for new files..." >> "$LOGFILE"

inotifywait -m -e create,moved_to "$DOWNLOADS" --format "%f" | while read NEWFILE
do
    FILEPATH="$DOWNLOADS/$NEWFILE"

    # Function to check if the file size is stable
    is_file_stable() {
        local file="$1"
        local size1 size2
        size1=$(stat --format="%s" "$file" 2>/dev/null)  # Get file size
        sleep 10  # Wait 10 seconds
        size2=$(stat --format="%s" "$file" 2>/dev/null)  # Get file size again
        [[ "$size1" == "$size2" ]]
    }

    echo "New file detected: $NEWFILE" >> "$LOGFILE"

    # Wait for file to stabilize before moving
    while [[ -f "$FILEPATH" ]]; do
        if is_file_stable "$FILEPATH"; then
            break  # Exit loop when file stops changing
        fi
        echo "Waiting for $NEWFILE to finish downloading..." >> "$LOGFILE"
        sleep 5  # Check again in 5 seconds
    done

    echo "Download completed: $NEWFILE" >> "$LOGFILE"

    # Move the file after confirming it's fully downloaded
    if [[ -f "$FILEPATH" ]]; then
        echo "Processing: $NEWFILE" >> "$LOGFILE"
        bash "$ORGANIZER_SCRIPT"
    fi
done
