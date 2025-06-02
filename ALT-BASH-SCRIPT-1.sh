#!/bin/bash

# ASSIGNMENT 1

echo " This is a bash script to check if a file exists or not in a directory."
echo
echo "###########################################################################"
echo
echo " Kindly make sure you pass the filename as an argument else you get error prompts."
echo "###########################################################################"
echo

# BASH SCRIPT TO CHECK IF A FILE EXISTS OR NOT


FILE=""

# Check if a filename was provided as a command-line argument
if [ -n "$1" ]; then
    FILE="$1"
else
    # Loop until a non-empty filename is provided
    while [ -z "$FILE" ]; do
        read -r -p "Please enter filename: " FILE
        if [ -z "$FILE" ]; then
            echo "No file name specified. Please retry again."
        fi
    done
fi

# Check the file type and existence
if [ -f "$FILE" ]; then
    echo "This file ('$FILE') exists and it is a regular file"
elif [ -d "$FILE" ]; then
    echo "This file ('$FILE') exists and it is a directory"
else
    echo "This file does not exist."
    exit 1
fi
