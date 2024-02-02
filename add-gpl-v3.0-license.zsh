#!/bin/zsh

# Check if a directory argument is provided
if [[ -z "$1" ]]; then
    echo "Usage: $0 <directory>"
    exit 1
fi

directory=$1
script_dir=$(dirname "$0")
license_source_file="$script_dir/LICENSE" # Path to the source LICENSE file

local dir=$1
local license_file="$dir/LICENSE"

# Check if LICENSE file exists, copy if not
if [[ ! -f "$license_file" ]] && [[ -f "$license_source_file" ]]; then
    cp "$license_source_file" "$license_file"
    echo "LICENSE file copied to $dir"
else
    echo "LICENSE file already exists in $dir"
fi
