#!/bin/bash

# pwd in the mounted directory
DIGITAL_OBJECTS_PATH=$1

#usually maps to the collection id
FOLDER_NAME=$2

find "$DIGITAL_OBJECTS_PATH/$FOLDER_NAME" -path "*/OTIFF/*" -not -name ".*" -not -name "Thumbs.db" -type f -printf "%f\n" | grep .tif  > ./$FOLDER_NAME-find-otiff.txt

echo "OTIFF: $(wc -l < $FOLDER_NAME-find-otiff.txt)" > $FOLDER_NAME-counts.txt

find "$DIGITAL_OBJECTS_PATH/$FOLDER_NAME" -path "*/PTIFF/*" -not -name ".*" -not -name "Thumbs.db" -type f -printf "%f\n" | grep .tif  > ./$FOLDER_NAME-find-ptiff.txt

echo "PTIFF: $(wc -l < $FOLDER_NAME-find-ptiff.txt)" >> $FOLDER_NAME-counts.txt

find "$DIGITAL_OBJECTS_PATH/$FOLDER_NAME" -path "*/JPEG/*" -not -name ".*" -not -name "Thumbs.db" -type f -printf "%f\n" | grep .jpg  > ./$FOLDER_NAME-find-jpeg.txt

echo "JPEG: $(wc -l < $FOLDER_NAME-find-jpeg.txt)" >> $FOLDER_NAME-counts.txt

find "$DIGITAL_OBJECTS_PATH/$FOLDER_NAME" -path "*/PDF/*" -not -name ".*" -not -name "Thumbs.db" -type f -printf "%f\n" | grep .pdf  > ./$FOLDER_NAME-find-pdf.txt

echo "PDF: $(wc -l < $FOLDER_NAME-find-pdf.txt)" >> $FOLDER_NAME-counts.txt

find "$DIGITAL_OBJECTS_PATH/$FOLDER_NAME" -path "*/PDFM/*" -not -name ".*" -not -name "Thumbs.db" -type f -printf "%f\n" | grep .pdf  > ./$FOLDER_NAME-find-pdfm.txt

echo "PDFM: $(wc -l < $FOLDER_NAME-find-pdfm.txt)" >> $FOLDER_NAME-counts.txt
