IP="firefox"
player_status=$(playerctl status -i "$IP" 2>&1)
if [[ "$player_status" = "No players found" ]]; then
	exit 1
else
	exit 0
fi
