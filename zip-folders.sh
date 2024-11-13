#!/bin/bash

# Change to the primary directory
cd $1
ZIPS_FOLDER=$2

# Iterate over subdirectories
for subdir in */; do
  # Extract the subdirectory name
  dirname=$(basename "$subdir")

  # Zip the subdirectory into a unique .zip file
  zip -0 -r -m -T "$ZIPS_FOLDER/$dirname.zip" "$subdir"
done
