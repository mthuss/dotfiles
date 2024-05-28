#!/bin/bash

#list of ignored players sepparated by spaces
IP="firefox"
player_status=$(playerctl status -i $IP)
if [[ $player_status = "Paused" ]] then
	icon="󰏤"
else
	icon="󰎇"
fi
artist=$(playerctl -i $IP metadata artist)
title=$(playerctl -i $IP metadata title)
text="$artist - $title"
echo "$icon $text"

