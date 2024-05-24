CONFIGS_PATH="$HOME/.scripts/monitorsetup"
HYPR_PATH="$HOME/.config/hypr"

set -e
set -u



laptop_HDMI1440p="󰍹  Laptop and 1440p screen"
laptop_HDMI1080p="󰍹  Laptop and 1080p screen"
laptop_HDMI768p="󰍹  Laptop and 768p screen"
HDMI1440p_only="󰍹  1440p screen only"
HDMI1080p_only="󰍹  1080p screen only"
HDMI768p_only="󰍹  768p screen only"
laptop_only="󰍹  Laptop screen only"

options="$laptop_HDMI1440p\n$laptop_HDMI1080p\n$laptop_HDMI768p\n$HDMI1440p_only\n$HDMI1080p_only\n$HDMI768p_only\n$laptop_only"

chosen="$(echo -e "$options" | rofi -lines 8 -dmenu -p "Monitors")"

function apply {
	option="$1"
	cp "$HYPR_PATH/monitors.conf" "$HYPR_PATH/monitors.conf.bak"
	cp "$CONFIGS_PATH/$1" "$HYPR_PATH/monitors.conf"
}

case $chosen in
	$laptop_HDMI1440p)
		apply "laptop_HDMI1440p";;
	$laptop_HDMI1080p)
		apply "laptop_HDMI1080p";;
	$laptop_HDMI768p)
		apply "laptop_HDMI768p";;
	$HDMI1440p_only)
		apply "HDMI1440p_only";;
	$HDMI1080p_only)
		apply "HDMI1080p_only";;
	$HDMI768p_only)
		apply "HDMI768p_only";;
	$laptop_only)
		apply "laptop_only";;
esac
