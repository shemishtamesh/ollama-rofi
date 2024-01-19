#!/bin/bash

TERMINAL=$TERM  # only `kitty` and `alacritty` are supported

choice=$(ollama list | rofi -dmenu -l 20 -p 'model')

if [[ "$choice" =~ ^NAME\ {27}* ]]; then
    exit 0
fi

case $TERMINAL in
    'kitty')
        kitty --execute ollama run $(echo $choice | awk '{print $1}')
        ;;
    'alacritty')
        alacritty --command ollama run $(echo $choice | awk '{print $1}')
esac

