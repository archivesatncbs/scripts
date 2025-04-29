#!/bin/bash

DIGITAL_OBJECTS_PATH=$1

# delete already existing extents-## .csv
rm -rf extents-$(basename -- $DIGITAL_OBJECTS_PATH).csv

# iterate over collection subdirectories, write extents-## .csv to the script's directory
for subdir in "$DIGITAL_OBJECTS_PATH"/*; do

  FOLDER_NAME=$(basename "$subdir")

  # process only directories at the top level, skip files
  if [ -d "$DIGITAL_OBJECTS_PATH/$FOLDER_NAME" ]; then

  find "$DIGITAL_OBJECTS_PATH/$FOLDER_NAME" -path "*/JPEG/*" -iregex '.*\.\(jpg\|jpeg\)' -type f -printf "%f\n" | echo -e "$FOLDER_NAME,$(wc -l)" | tr '_' '-'>> extents-$(basename -- $DIGITAL_OBJECTS_PATH).csv

  else
    echo -e "skipping $FOLDER_NAME"

  fi

done

sort --version-sort extents-$(basename -- $DIGITAL_OBJECTS_PATH).csv --output extents-$(basename -- $DIGITAL_OBJECTS_PATH).csv

cat extents-$(basename -- $DIGITAL_OBJECTS_PATH).csv
