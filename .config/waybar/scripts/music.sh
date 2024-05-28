#!/bin/bash

#list of ignored players sepparated by spaces
IP="firefox"
player_status=$(playerctl status -i $IP 2>/dev/null)
if [[ $player_status = "Paused" ]] then
	icon="󰏤"
else
	icon="󰎇"
fi

echo "$(playerctl metadata --format "$icon {{artist}} - {{title}}" 2>/dev/null)"

