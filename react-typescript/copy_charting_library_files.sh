#!/bin/sh

remove_if_directory_exists() {
	if [ -d "$1" ]; then rm -Rf "$1"; fi
}

BRANCH="main";
REPOSITORY='git@github.com:xlorne/charting_library.git'

# Using a fixed directory name for cloning
CLONE_DIR="./charting_library"

remove_if_directory_exists "$CLONE_DIR"

# Cloning into a fixed directory
git clone -q --depth 1 -b "$BRANCH" $REPOSITORY "$CLONE_DIR"

remove_if_directory_exists "public/charting_library"
remove_if_directory_exists "public/datafeeds"
remove_if_directory_exists "src/charting_library"

# Ensure these paths are correct relative to your script's location
cp -r "$CLONE_DIR/charting_library" public
cp -r "$CLONE_DIR/datafeeds" public
cp -r "$CLONE_DIR/charting_library" src

remove_if_directory_exists "$CLONE_DIR"
