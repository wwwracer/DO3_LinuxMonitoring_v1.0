#!/bin/bash

chmod +x ./func.sh
source ./func.sh

# sudo apt install net-tools -y  #for ip addr

hostname=$(hostname)
timezone=$(timedatectl | grep "Time zone" | awk '{print $3, $4, $5}')
username=$(whoami)
os=$(awk '{printf "%s %s %s", $1, $2, $3}' /etc/issue)
date=$(date)
uptime=$(uptime | awk '{print $1}')
uptime_seconds=$(awk '{print $1}' /proc/uptime) # не работает
ip=$(hostname -I | awk '{print $1}')
mask=$(ip addr | grep "inet" | awk 'NR==2' | awk '{print $2}')
gateway=$(ip route | awk '{print $3}' | head -n 1)
ram_total=$(free -m | awk '/Mem:/ {printf "%.3f GB", $2/1024}')
ram_used=$(free -m | awk '/Mem:/ {printf "%.3f GB", $3/1024}')
ram_free=$(free -m | awk '/Mem:/ {printf "%.3f GB", $4/1024}')
space_root=$(df -h / | awk 'NR==2 {printf "%.2f MB", $4}')
space_root_used=$(df -h / | awk 'NR==2 {printf "%.2f MB", $3}')
space_root_free=$(df -h / | awk 'NR==2 {printf "%.2f MB", $4}')

print_system_info # function from func.sh

while true; do
    read -p "Do you want to save this information to a file? (y/n): " answer

    if [[ $answer == "Y" || $answer == "y" || $answer == "н" || $answer == "Н" ]]; then
        file_to_save="$(date '+%d_%m_%y_%H_%M_%S').status"
        print_system_info >> $file_to_save
        echo "Write is done. File: $file_to_save"
        break
    elif [[ $answer == "N" || $answer == "n" || $answer == "т" || $answer == "Т" ]]; then
        break
    else
        echo "Error: Incorrect input"
        break
    fi
done