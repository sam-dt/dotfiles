#!/bin/bash

# Run this file from dotfiles directory

FILES_TO_SYMLINK=$(find "$(pwd)" -type f -maxdepth 1 -name ".*")

for file in ${FILES_TO_SYMLINK}; do
	target="$HOME/$(basename "$file")"
	echo "Symlinking $file to $target"
	ln -sf "$file" "$target"
done

DIRECTORIES_TO_SYMLINK=("$(pwd)/.doom.d/")

for dir in "${DIRECTORIES_TO_SYMLINK[@]}"; do
	target="$HOME/$(basename "$dir")"
	echo "Symlinking $dir to $target"
	ln -sf "$dir" "$target"
done
