#!/bin/bash

colors=(
  '\e[97m'  # 1 - white
  '\e[31m'  # 2 - red
  '\e[32m'  # 3 - green
  '\e[34m'  # 4 - blue
  '\e[35m'  # 5 - purple
  '\e[30m'  # 6 - black
)
bg_colors=(
  '\e[107m'  # 1 - white background
  '\e[41m'   # 2 - red background
  '\e[42m'   # 3 - green background
  '\e[44m'   # 4 - blue background
  '\e[45m'   # 5 - purple background
  '\e[40m'   # 6 - black background
)
RESET='\e[0m'

bg_title=${bg_colors[$(( $1 - 1 ))]}
fg_title=${colors[$(( $2 - 1 ))]}
bg_value=${bg_colors[$(( $3 - 1 ))]}
fg_value=${colors[$(( $4 - 1 ))]}

#first argument
case $1 in
    1) back=$hostname ;;
    2) back=$timezone ;;
    3) back=$username ;;
    4) back=$os ;;
    5) back=$dat ;;
    6) back=$uptime ;;
    7) back=$ip ;;
    8) back=$mask ;;
    9) back=$gateway ;;
    10) back=$ram_total ;;
    11) back=$ram_used ;;
    12) back=$ram_free ;;
    13) back=$space_root ;;
    14) back=$space_root_used ;;
    15) back=$space_root_free ;;
    *) echo "Error: first argument must be from 1 to 15" ; exit 1 ;;
esac

#second argument
case $2 in
    1) color=$WHITE ;;
    2) color=$RED ;;
    3) color=$GREEN ;;
    4) color=$BLUE ;;
    5) color=$PURPLE ;;
    6) color=$BLACK ;;
    *) echo "Error: second argument must be from 1 to 6" ; exit 1 ;;
esac
 