#!/bin/bash

URL=$(wl-paste)
if grep -qE "watch\?v=[a-zA-Z0-9\_-]{11}" <<< $URL; then
#	ID=$(grep -Eo "watch\?v=[a-zA-Z0-9\_-]{11}" <<< $URL)
	mpv "$URL" & notify-send -u normal -a "mpv clipboard play" "mpv clipboard play" "Loading video"
else
	notify-send -u normal -a "mpv clipboard play" "mpv clipboard play" "Clipboard content is not a valid Youtube URL"
fi


