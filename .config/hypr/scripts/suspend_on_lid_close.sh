if [[ -f $HOME/.suspend_olc ]]; then
	systemctl suspend
else
	hyprlock
fi
