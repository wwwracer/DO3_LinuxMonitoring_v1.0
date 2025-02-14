#!/bin/bash

if [ -z "$1" ]; then
    echo "Enter argument"
    exit
fi

if [[ "$1" = ^-?[0-9]+$ ]]; then
    echo "Error: line "
else
    echo "Data variables: $1"
fi