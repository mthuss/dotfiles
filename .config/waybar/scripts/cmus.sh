#!/bin/bash

player_status=$(cmus-remote -C status | grep status | sed "s/status //g")
if [[ $player_status = "paused" ]] then
	icon="󰏤"
else
	icon="󰎇"
fi
text=$(cmus-remote -C "format_print '%a - %t'")
echo "$icon $text"

