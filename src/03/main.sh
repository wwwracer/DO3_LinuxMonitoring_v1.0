#!/bin/bash

#includes
source ./color.sh
source ./data.sh
chmod +x ./data.sh ./color.sh 

# valid args
if [ $# -ne 4 ]; then
        echo "There should be 4 parameters."
        exit
    fi

# valid coincidence args
if [ $1 -eq $2 ] || [ $3 -eq $4 ]; then
  echo "colors must be different, try again"
  exit
fi

print_system_info # func output from func.sh