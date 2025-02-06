#!/bin/bash

# Set up main directory (Downloads)
DOWNLOADS="$HOME/Downloads"

# Create category folders inside Downloads
DOCS="$DOWNLOADS/Documents"
SOFTWARE="$DOWNLOADS/Software"
IMAGES="$DOWNLOADS/Images"
VIDEOS="$DOWNLOADS/Videos"
AUDIO="$DOWNLOADS/Audio"
ARCHIVES="$DOWNLOADS/Archives"
SCRIPTS="$DOWNLOADS/Scripts"
OTHERS="$DOWNLOADS/Miscellaneous"
LOGFILE="$DOWNLOADS/organizer.log"

# Subdirectories for classification
mkdir -p "$DOCS/PDFs" "$DOCS/Excels" "$DOCS/WordDocs" "$DOCS/TextFiles"
mkdir -p "$SOFTWARE"
mkdir -p "$IMAGES/JPEGs" "$IMAGES/PNGs" "$IMAGES/GIFs" "$IMAGES/OtherImages"
mkdir -p "$VIDEOS/MP4s" "$VIDEOS/MKV" "$VIDEOS/AVIs" "$VIDEOS/OtherVideos"
mkdir -p "$AUDIO/MP3s" "$AUDIO/FLACs" "$AUDIO/OtherAudio"
mkdir -p "$ARCHIVES/ZIPs" "$ARCHIVES/RARs" "$ARCHIVES/TARs"
mkdir -p "$SCRIPTS/ShellScripts" "$SCRIPTS/PythonScripts" "$SCRIPTS/OtherScripts"
mkdir -p "$OTHERS"

# Function to move files and handle duplicates
move_file() {
    src="$1"
    dest="$2"

    # Ensure destination exists
    mkdir -p "$dest"

    # Move file
    mv "$src" "$dest"
}

move_file() {
    src="$1"
    dest="$2"
    base_name=$(basename "$src")
    if [[ -e "$dest/$base_name" ]]; then
        timestamp=$(date +%s)
        new_name="${base_name%.*}_$timestamp.${base_name##*.}"
        mv "$src" "$dest/$new_name"
        echo "Moved: $src -> $dest/$new_name" >> "$LOGFILE"
    else
        mv "$src" "$dest/"
        echo "Moved: $src -> $dest/$base_name" >> "$LOGFILE"
    fi
}

# Export function so it's available to subshells
export -f move_file

# Move Documents inside Downloads/Documents
find "$DOWNLOADS" -maxdepth 1 -type f \( -iname "*.pdf" \) -exec bash -c 'move_file "$0" "$1"' {} "$DOCS/PDFs" \;
find "$DOWNLOADS" -maxdepth 1 -type f \( -iname "*.docx" -o -iname "*.doc" \) -exec bash -c 'move_file "$0" "$1"' {} "$DOCS/WordDocs" \;
find "$DOWNLOADS" -maxdepth 1 -type f \( -iname "*.xls" -o -iname "*.xlsx" \) -exec bash -c 'move_file "$0" "$1"' {} "$DOCS/Excels" \;
find "$DOWNLOADS" -maxdepth 1 -type f \( -iname "*.txt" -o -iname "*.md" \) -exec bash -c 'move_file "$0" "$1"' {} "$DOCS/TextFiles" \;

# Move Software inside Downloads/Software
find "$DOWNLOADS" -maxdepth 1 -type f \( -iname "*.deb" -o -iname "*.AppImage" \) -exec bash -c 'move_file "$0" "$1"' {} "$SOFTWARE" \;

# Move Images inside Downloads/Images
find "$DOWNLOADS" -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.jpeg" \) -exec bash -c 'move_file "$0" "$1"' {} "$IMAGES/JPEGs" \;
find "$DOWNLOADS" -maxdepth 1 -type f \( -iname "*.png" \) -exec bash -c 'move_file "$0" "$1"' {} "$IMAGES/PNGs" \;
find "$DOWNLOADS" -maxdepth 1 -type f \( -iname "*.gif" \) -exec bash -c 'move_file "$0" "$1"' {} "$IMAGES/GIFs" \;
find "$DOWNLOADS" -maxdepth 1 -type f \( -iname "*.bmp" -o -iname "*.tiff" -o -iname "*.webp" \) -exec bash -c 'move_file "$0" "$1"' {} "$IMAGES/OtherImages" \;

# Move Videos inside Downloads/Videos
find "$DOWNLOADS" -maxdepth 1 -type f \( -iname "*.mp4" \) -exec bash -c 'move_file "$0" "$1"' {} "$VIDEOS/MP4s" \;
find "$DOWNLOADS" -maxdepth 1 -type f \( -iname "*.mkv" \) -exec bash -c 'move_file "$0" "$1"' {} "$VIDEOS/MKV" \;
find "$DOWNLOADS" -maxdepth 1 -type f \( -iname "*.avi" -o -iname "*.mov" \) -exec bash -c 'move_file "$0" "$1"' {} "$VIDEOS/AVIs" \;
find "$DOWNLOADS" -maxdepth 1 -type f \( -iname "*.flv" -o -iname "*.wmv" \) -exec bash -c 'move_file "$0" "$1"' {} "$VIDEOS/OtherVideos" \;

# Move Audio inside Downloads/Audio
find "$DOWNLOADS" -maxdepth 1 -type f \( -iname "*.mp3" \) -exec bash -c 'move_file "$0" "$1"' {} "$AUDIO/MP3s" \;
find "$DOWNLOADS" -maxdepth 1 -type f \( -iname "*.flac" \) -exec bash -c 'move_file "$0" "$1"' {} "$AUDIO/FLACs" \;
find "$DOWNLOADS" -maxdepth 1 -type f \( -iname "*.wav" -o -iname "*.ogg" \) -exec bash -c 'move_file "$0" "$1"' {} "$AUDIO/OtherAudio" \;

# Move Archives inside Downloads/Archives
find "$DOWNLOADS" -maxdepth 1 -type f \( -iname "*.zip" \) -exec bash -c 'move_file "$0" "$1"' {} "$ARCHIVES/ZIPs" \;
find "$DOWNLOADS" -maxdepth 1 -type f \( -iname "*.rar" \) -exec bash -c 'move_file "$0" "$1"' {} "$ARCHIVES/RARs" \;
find "$DOWNLOADS" -maxdepth 1 -type f \( -iname "*.tar" -o -iname "*.gz" -o -iname "*.7z" \) -exec bash -c 'move_file "$0" "$1"' {} "$ARCHIVES/TARs" \;

# Move Scripts inside Downloads/Scripts
find "$DOWNLOADS" -maxdepth 1 -type f \( -iname "*.sh" \) -exec bash -c 'move_file "$0" "$1"' {} "$SCRIPTS/ShellScripts" \;
find "$DOWNLOADS" -maxdepth 1 -type f \( -iname "*.py" \) -exec bash -c 'move_file "$0" "$1"' {} "$SCRIPTS/PythonScripts" \;
find "$DOWNLOADS" -maxdepth 1 -type f \( -iname "*.js" -o -iname "*.pl" -o -iname "*.rb" -o -iname "*.lua" \) -exec bash -c 'move_file "$0" "$1"' {} "$SCRIPTS/OtherScripts" \;

# Move Unclassified Files inside Downloads/Miscellaneous
find "$DOWNLOADS" -maxdepth 1 -type f -exec bash -c 'move_file "$0" "$1"' {} "$OTHERS" \;

echo "File organization completed at $(date)" >> "$LOGFILE"




