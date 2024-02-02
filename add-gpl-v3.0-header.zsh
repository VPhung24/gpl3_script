#!/bin/zsh

# Check if a directory argument is provided
if [[ -z "$1" ]]; then
    echo "Usage: $0 <directory>"
    exit 1
fi

directory=$1
script_dir=$(dirname "$0")
header_file="$script_dir/header.txt"

# Check if the header file exists
if [[ ! -f "$header_file" ]]; then
    echo "Header file not found: $header_file"
    exit 1
fi

header=$(cat "$header_file")

# Ask for the author's name
echo -n "author(s): "
read author_name

# Escape special characters in author_name for sed
author_name_escaped=$(printf '%s\n' "$author_name" | sed -e 's/[\/&]/\\&/g')

# Get the current year
current_year=$(date +"%Y")

# Ask for a one-line description of the program
echo -n "one line to give the program's name and a brief idea of what it does: "
read program_one_line_description

# Escape special characters in program_one_line_description for sed
program_one_line_description_escaped=$(printf '%s\n' "$program_one_line_description" | sed -e 's/[\/&]/\\&/g')

# Replace placeholders in the header file
header=$(sed -e "s/<name of author>/$author_name_escaped/g" -e "s/<year>/$current_year/g" -e "s/<one line to give the program's name and a brief idea of what it does.>/$program_one_line_description_escaped/g" <<<"$header")

# Process each TypeScript file, excluding node_modules directories and directories starting with .
find "$directory" \( -type d -name "node_modules" -prune \) -o \( -type d -name ".*" -prune \) -o -type f -name "*.ts" -exec zsh -c '
    file=$1
    header=$2
    temp_file=$(mktemp)
    {
        echo "$header \n"
        cat "$file"
    } > "$temp_file" && mv "$temp_file" "$file"
    echo "Processed $file"
' zsh {} "$header" \;

echo "Processing complete."
