#!/bin/bash

# Ensure the environment variable is set
if [ -z "$DIRECTORIES_TO_SET" ]; then
  echo "DIRECTORIES_TO_SET is not set."
  exit 1
fi

# Split the space list into an array (space is chosen because of docker compose folded string literals)
IFS=' ' read -r -a directories <<< "$DIRECTORIES_TO_SET"

# Iterate over the array and apply chown
for dir in "${directories[@]}"; do
  mkdir -p "$dir"
  chown -R "$UID":"$UID" "$dir"
done