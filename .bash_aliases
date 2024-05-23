#searches history
alias gh='history|grep'

#used for managing the dotfiles repository
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

#Shortcut for editing this very file
alias valias='vim $HOME/.bash_aliases'

#Downloads bandcamp albums w/ proper formating and metadata (format still needs to be appended manually)
alias bcdl='yt-dlp -o "%(playlist_index)s. %(title)s.%(ext)s" --add-metadata'

#Copies pwd to clipboard
#alias cpwd='pwd | xargs -i echo -n \"{}\"|  xclip -selection clipboard'

#Copies pwd to clipboard (on wayland)
alias cpwd='pwd | wl-copy'

#alias cpwd='pwd | xargs -i echo -n \"{}\"|  xclip -selection clipboard'
alias opwd='(alacritty & disown) &> /dev/null'

#Shorten some common commands
alias c='clear'
alias e='exit'
alias la='ls -a'
alias ll='ls -l'
alias lla='ls -la'
alias pvpn='protonvpn-cli'
alias psmb='python3 $HOME/.psmb.py'
alias pacclear='paccache -rk2'
alias mozconf='/usr/lib/mozc/mozc_tool --mode=config_dialog'

#Opens code-oss with liveshare apis enabled
alias codels='code --enable-proposed-api ms-vsliveshare.vsliveshare'

#Opens tetrio
alias tetris='cd $HOME/.tetrio-desktop-9.0.0/ && ./TETR.IO'

#Runs mpv using dGPU offload
alias nmpv='mpv --hwdec=nvdec --vo=gpu --gpu-api=vulkan --hwdec-codecs=auto'

alias nyaa='bash $HOME/.scripts/nyaa.sh'

#convert multiple separate files into separate pdfs
alias batchpdf='for file in $(ls); do convert $file "${file%.*}".pdf; done'

#takes a screenshot with area selection
alias screenshot='slurp | grim -g - - | wl-copy'

#alias nmtui='nmcli device wifi rescan && echo "Scanning wifi networks" && sleep 5 && nmtui'

mkcd () { mkdir -p "$@" && eval cd "\"\$$#\""; }
resize () { convert $2 -resize $1% $2; }
getsize () { du -cha --max-depth=$1 "$2" | grep -E "M|G" | sort -h; }
function clip {
startsecs=$(echo $2 | awk -F: '{ print ($1 * 3600) + ($2 * 60) + $3 }')
endsecs=$(echo $3 | awk -F: '{ print ($1 * 3600) + ($2 * 60) + $3 }')
extension="${1#*.}"
#ffmpeg -i "$1" -ss $2 -c copy -t $((endsecs-startsecs)) -map 0:v:$4? -map 0:a:$5? "$6".$extension
ffmpeg -i "$1" -ss $2 -c copy -t $((endsecs-startsecs)) -c:a copy -c:v copy "$4".$extension
}

function swcodec {
LANG=C pactl list cards | grep Name | grep bluez_card &>/dev/null  && DEVCARD=$(LANG=C pactl list cards | grep Name | grep -Eo "bluez_card.([0-9A-Fa-f]{2}[_]){5}([0-9A-Fa-f]{2})$")
pactl send-message /card/$DEVCARD/bluez list-codecs | grep sbc_xq_552 &> /dev/null && pactl send-message "/card/$DEVCARD/bluez" switch-codec '"sbc_xq_552"' &> /dev/null && notify-send -u normal -a "Headphone Monitor" "Codec switched" "Codec switched to SBC XQ 552kbps" || notify-send -u normal -a "Headphone Monitor" "Codec not switched" "Maybe desired codec is already selected?"
}

