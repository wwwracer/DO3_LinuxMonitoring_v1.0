#!/bin/bash

#source ./data.sh
#hmod +x ./data.sh


# check parameters
if [ $# -ne 1 ]; then
    echo "file need one arg  ex: <./main.sh /var/log/>"
    exit 1
fi

DIR_PATH=$1

# check if the directory exists
if [[ "${DIR_PATH: -1}" != "/" ]]; then
    echo "the path needs to end at /"
    exit 1
fi

if [ ! -d "$DIR_PATH" ]; then
    echo "dir is null $DIR_PATH"
    exit 1
fi

# data 
START_TIME=$(date +%s)
TOTAL_FOLDERS=$(find "$DIR_PATH" -type d | wc -l) 
TOP_5_FOLDERS=$(du -h "$DIR_PATH"  | sort -hr | head -n 5)
TOTAL_FILES=$(find "$DIR_PATH" -type f | wc -l)
CONF_FILES=$(find "$DIR_PATH" -type f -name "*.conf" | wc -l)
TEXT_FILES=$(find "$DIR_PATH" -type f -exec file --mime-type {} + | grep "text/" | wc -l)
EXECUTABLE_FILES=$(find "$DIR_PATH" -type f -executable | wc -l)
LOG_FILES=$(find "$DIR_PATH" -type f -name "*.log" | wc -l)
ARCHIVE_FILES=$(find "$DIR_PATH" -type f \( -name "*.zip" -o -name "*.tar" -o -name "*.gz" -o -name "*.7z" \) | wc -l)
SYMLINKS=$(find "$DIR_PATH" -type l | wc -l)

TOP_10_FILES=$(find "$DIR_PATH" -type f -exec du -h {} + 2>/dev/null | sort -hr | head -n 10 | while read size path; do
    type=$(file --mime-type -b "$path")
    echo "$path, $size, $type"
done)

TOP_10_EXEC_FILES=$(find "$DIR_PATH" -type f -executable -exec du -h {} + 2>/dev/null | sort -hr | head -n 10 | while read size path; do
    hash=$(md5sum "$path" | awk '{print $1}')
    echo "$path, $size, $hash"
done)

END_TIME=$(date +%s)
EXECUTION_TIME=$(echo "$END_TIME - $START_TIME" | bc)


function print_dir_info {
    echo "Total number of folders (including all nested ones) = $TOTAL_FOLDERS"
    echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
    echo "$TOP_5_FOLDERS"
    echo "Total number of files = $TOTAL_FILES"
    echo "Number of:"
    echo "Configuration files (with the .conf extension) = $CONF_FILES"
    echo "Text files = $TEXT_FILES"
    echo "Executable files = $EXECUTABLE_FILES"
    echo "Log files (with the extension .log) = $LOG_FILES"
    echo "Archive files = $ARCHIVE_FILES"
    echo "Symbolic links = $SYMLINKS"
    echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
    echo "$TOP_10_FILES"
    echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):"
    echo "$TOP_10_EXEC_FILES"
    echo "Script execution time (in seconds) = $EXECUTION_TIME"
    
    echo -e "\n"
    echo "IF YOU SEE ERR \"Permission denied\" USE: <sudo ./main {arg}>"
}

print_dir_info
