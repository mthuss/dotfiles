if [[ -f $HOME/.suspend_olc ]]; then
	notify-send -u normal -a "Suspend on Lid Close" "Suspend on Lid Close" "Toggled off"
	rm $HOME/.suspend_olc

else
	notify-send -u normal -a "Suspend on Lid Close" "Suspend on Lid Close" "Toggled on"
	> $HOME/.suspend_olc
fi
