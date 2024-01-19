#!/bin/bash

choice=$(ollama list | rofi -dmenu -l 20 -p 'model')

if [[ "$choice" =~ ^NAME\ {27}* ]]; then
    exit 0
fi

kitty --execute ollama run $(echo $choice | awk '{print $1}')

