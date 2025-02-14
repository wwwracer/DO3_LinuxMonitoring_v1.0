#!/bin/bash

#send data to sys
hostname=$(hostname)
timezone=$(timedatectl | grep "Time zone" | awk '{print $3, $4, $5}')
username=$(whoami)
os=$(awk '{printf "%s %s %s", $1, $2, $3}' /etc/issue)
date=$(date)
uptime=$(uptime | awk '{print $1}')
uptime_seconds=$(awk '{print $1}' /proc/uptime)
ip=$(hostname -I | awk '{print $1}')
mask=$(ip addr | grep "inet" | awk 'NR==2' | awk '{print $2}')
gateway=$(ip route | awk '{print $3}' | head -n 1)
ram_total=$(free -m | awk '/Mem:/ {printf "%.3f GB", $2/1024}')
ram_used=$(free -m | awk '/Mem:/ {printf "%.3f GB", $3/1024}')
ram_free=$(free -m | awk '/Mem:/ {printf "%.3f GB", $4/1024}')
space_root=$(df -h / | awk 'NR==2 {printf "%.2f MB", $4}')
space_root_used=$(df -h / | awk 'NR==2 {printf "%.2f MB", $3}')
space_root_free=$(df -h / | awk 'NR==2 {printf "%.2f MB", $4}')


function print_system_info {
  echo -e "${bg_title}${fg_title}HOSTNAME${RESET}=${bg_value}${fg_value}$hostname${RESET}"
  echo -e "${bg_title}${fg_title}TIMEZONE${RESET}=${bg_value}${fg_value}$timezone${RESET}"
  echo -e "${bg_title}${fg_title}USER${RESET}=${bg_value}${fg_value}$username${RESET}"
  echo -e "${bg_title}${fg_title}OS${RESET}=${bg_value}${fg_value}$os${RESET}"
  echo -e "${bg_title}${fg_title}DATE${RESET}=${bg_value}${fg_value}$date${RESET}"
  echo -e "${bg_title}${fg_title}UPTIME${RESET}=${bg_value}${fg_value}$uptime${RESET}"
  echo -e "${bg_title}${fg_title}UPTIME_SECONDS${RESET}=${bg_value}${fg_value}$uptime_seconds${RESET}"
  echo -e "${bg_title}${fg_title}IP${RESET}=${bg_value}${fg_value}$ip${RESET}"
  echo -e "${bg_title}${fg_title}MASK${RESET}=${bg_value}${fg_value}$mask${RESET}"
  echo -e "${bg_title}${fg_title}GATEWAY${RESET}=${bg_value}${fg_value}$gateway${RESET}"
  echo -e "${bg_title}${fg_title}RAM_TOTAL${RESET}=${bg_value}${fg_value}$ram_total${RESET}"
  echo -e "${bg_title}${fg_title}RAM_USED${RESET}=${bg_value}${fg_value}$ram_used${RESET}"
  echo -e "${bg_title}${fg_title}RAM_FREE${RESET}=${bg_value}${fg_value}$ram_free${RESET}"
  echo -e "${bg_title}${fg_title}SPACE_ROOT${RESET}=${bg_value}${fg_value}$space_root${RESET}"
  echo -e "${bg_title}${fg_title}SPACE_ROOT_USED${RESET}=${bg_value}${fg_value}$space_root_used${RESET}"
  echo -e "${bg_title}${fg_title}SPACE_ROOT_FREE${RESET}=${bg_value}${fg_value}$space_root_free${RESET}"
}