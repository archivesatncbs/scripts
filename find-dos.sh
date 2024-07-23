#!/bin/bash

# pwd in the mounted directory
DIGITAL_OBJECTS_PATH=$1

#usually maps to the collection id
FOLDER_NAME=$2

find "$DIGITAL_OBJECTS_PATH/$FOLDER_NAME" -path "*/OTIFF/*" -not -name ".*" -not -name "Thumbs.db" -type f -printf "%f\n" | grep -e .tif -e .tiff -e .TIF -e .TIFF > $FOLDER_NAME-find-otiff.txt

find "$DIGITAL_OBJECTS_PATH/$FOLDER_NAME" -path "*/PTIFF/*" -not -name ".*" -not -name "Thumbs.db" -type f -printf "%f\n" | grep -e .tif -e .tiff -e .TIF -e .TIFF > $FOLDER_NAME-find-ptiff.txt

find "$DIGITAL_OBJECTS_PATH/$FOLDER_NAME" -path "*/JPEG/*" -not -name ".*" -not -name "Thumbs.db" -type f -printf "%f\n" | grep -e .jpg -e .jpeg -e .JPG -e .JPEG > $FOLDER_NAME-find-jpeg.txt

find "$DIGITAL_OBJECTS_PATH/$FOLDER_NAME" -path "*/PDF/*" -not -name ".*" -not -name "Thumbs.db" -type f -printf "%f\n" | grep -e .pdf -e .PDF > $FOLDER_NAME-find-pdf.txt

find "$DIGITAL_OBJECTS_PATH/$FOLDER_NAME" -path "*/PDFM/*" -not -name ".*" -not -name "Thumbs.db" -type f -printf "%f\n" | grep -e .pdf -e .PDF > $FOLDER_NAME-find-pdfm.txt
