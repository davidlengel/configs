#!/bin/bash

# Get the directory of the script
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

# Files to replace with symlinks
declare -A FILES=(
  ["~/.bashrc"]="../configs/mac/.bashrc"
  ["~/.vimrc"]="../configs/.vimrc"
  ["~/.tmux.conf"]="../configs/.tmux.conf"
)

# Backup existing files and create symlinks
for TARGET in "${!FILES[@]}"; do
  SOURCE_FILE="$SCRIPT_DIR/${FILES[$TARGET]}"
  TARGET_FILE=$(eval echo "$TARGET")

  if [[ -e "$TARGET_FILE" && ! -L "$TARGET_FILE" ]]; then
    echo "Backing up existing file: $TARGET_FILE"
    mv "$TARGET_FILE" "$TARGET_FILE.bak"
  fi

  if [[ -L "$TARGET_FILE" ]]; then
    echo "Removing existing symlink: $TARGET_FILE"
    rm "$TARGET_FILE"
  fi

  echo "Creating symlink: $TARGET_FILE -> $SOURCE_FILE"
  ln -s "$SOURCE_FILE" "$TARGET_FILE"
done

echo "All symlinks created successfully."
