#!/bin/bash

TYPE=$1
SCREENSHOT_PATH="$HOME/Imagens/Screenshots"

DATE=$(date +"%Y-%m-%d_%H-%M-%S")
if [ "$TYPE" = "full" ]; then 
	grim "$SCREENSHOT_PATH"/$DATE.png && notify-send -u normal -a "Screenshot" "Full screenshot taken" "Saved to "$SCREENSHOT_PATH"/$DATE.png"
elif [ "$TYPE" = "selection" ]; then
	slurp | grim -g - "$SCREENSHOT_PATH"/$DATE.png && notify-send -u normal -a "Screenshot" "Screenshot taken" "Saved to "$SCREENSHOT_PATH"/$DATE.png"
elif [ "$TYPE" = "selection-clipboard" ]; then
	slurp | grim -g - - | wl-copy && notify-send -u normal -a "Screenshot" "Screenshot taken" "Copied to clipboard"
else
	echo "Invalid option"
fi
