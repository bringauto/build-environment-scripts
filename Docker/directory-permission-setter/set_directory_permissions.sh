#!/bin/bash

# Ensure the environment variable is set
if [ -z "$DIRECTORIES_TO_SET" ]; then
  echo "Error: DIRECTORIES_TO_SET environment variable is not set. Please provide a space-separated list of directories."
  exit 1
fi

# Split the space list into an array (space is chosen because of docker compose folded string literals)
IFS=' ' read -r -a directories <<< "$DIRECTORIES_TO_SET"

# Iterate over the array and apply chown
for dir in "${directories[@]}"; do
  # Ensure path starts with /
  if [[ ! "$dir" =~ ^/ ]]; then
    echo "Error: Path must be absolute: $dir"
    exit 1
  fi
  # Prevent path traversal
  if [[ "$path" =~ \.\. ]]; then
    echo "Error: Path cannot contain ..: $dir"
    exit 1
  fi
  mkdir -p "$dir"
  chown -R "$UID":"$UID" "$dir"
done