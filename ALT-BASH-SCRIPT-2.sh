#!/bin/bash

echo "This is a bash script to count the number of files in a directory."
echo
echo "###########################################################################"
echo

# ASSIGNMENT 2  

DIRECTORY_PATH=""

# STEP 1 = Check if a directory path was provided as a command-line argument
if [ -n "$1" ]; then
    DIRECTORY_PATH="$1"
else
    
	# SUB-STEP 1 = Do the below until a non-empty directory path is provided by the user
    while [ -z "$DIRECTORY_PATH" ]; do
        read -r -p "Please enter the absolute path to the directory: " DIRECTORY_PATH
        if [ -z "$DIRECTORY_PATH" ]; then
            echo "No directory path is specified. Please try again."
        fi
    done
fi

# STEP 2 = Validate if the provided path is actually a directory or not

if [ ! -d "$DIRECTORY_PATH" ]; then
    echo "Error: '$DIRECTORY_PATH' is not a directory"
    exit 1
fi

count=$(find "$DIRECTORY_PATH" -maxdepth 1 -type f -print0 | xargs -0 -r ls | wc -l)

# Print the result
echo "################################"
echo
echo "Number of regular files in '$DIRECTORY_PATH': $count"
echo
echo "###############################"
