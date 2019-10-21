#!/bin/bash

FILES_TO_SYMLINK=$(find "$(pwd)" -type f -maxdepth 1 -name ".*")

for file in ${FILES_TO_SYMLINK}; do
	target="$HOME/$(basename "$file")"
	echo "Symlinking $file to $target"
	ln -sf "$file" "$target"
done

