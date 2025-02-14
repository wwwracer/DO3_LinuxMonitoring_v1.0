#!/bin/bash

# include config file
source ./config.cfg

source ./color.sh
source ./data.sh

chmod +x ./data.sh ./color.sh ./config.cfg

# default color
DEFAULT_COLUMN1_BACKGROUND=6  # black
DEFAULT_COLUMN1_FONT_COLOR=1  # white
DEFAULT_COLUMN2_BACKGROUND=2  # red
DEFAULT_COLUMN2_FONT_COLOR=4  # blue

# if config.cfg emptu, set default value
column1_background=${column1_background:-$DEFAULT_COLUMN1_BACKGROUND}
column1_font_color=${column1_font_color:-$DEFAULT_COLUMN1_FONT_COLOR}
column2_background=${column2_background:-$DEFAULT_COLUMN2_BACKGROUND}
column2_font_color=${column2_font_color:-$DEFAULT_COLUMN2_FONT_COLOR}

# valid coincidence args
if [ $column1_background -eq $column1_font_color ] || [ $column2_background -eq $column2_font_color ]; then
  echo "Цвета шрифта и фона одного столбца не должны совпадать. Пожалуйста, исправьте конфигурационный файл."
  exit 2
fi

# set color read config.cfg
bg_title=${bg_colors[$(( $column1_background - 1 ))]}
fg_title=${colors[$(( $column1_font_color - 1 ))]}
bg_value=${bg_colors[$(( $column2_background - 1 ))]}
fg_value=${colors[$(( $column2_font_color - 1 ))]}

print_system_info

column1_background_source="default"
column1_font_color_source="default"
column2_background_source="default"
column2_font_color_source="default"

# is the data taken from a file?
if [ "${column1_background}" != "${DEFAULT_COLUMN1_BACKGROUND}" ]; then
  column1_background_source="config"
fi
if [ "${column1_font_color}" != "${DEFAULT_COLUMN1_FONT_COLOR}" ]; then
  column1_font_color_source="config"
fi
if [ "${column2_background}" != "${DEFAULT_COLUMN2_BACKGROUND}" ]; then
  column2_background_source="config"
fi
if [ "${column2_font_color}" != "${DEFAULT_COLUMN2_FONT_COLOR}" ]; then
  column2_font_color_source="config"
fi

# input seting color 
echo
echo "Column 1 background = ${column1_background} (${bg_colors[$(( $column1_background - 1 ))]}) \"${column1_background_source}\""
echo "Column 1 font color = ${column1_font_color} (${colors[$(( $column1_font_color - 1 ))]}) \"${column1_font_color_source}\""
echo "Column 2 background = ${column2_background} (${bg_colors[$(( $column2_background - 1 ))]}) \"${column2_background_source}\""
echo "Column 2 font color = ${column2_font_color} (${colors[$(( $column2_font_color - 1 ))]}) \"${column2_font_color_source}\""