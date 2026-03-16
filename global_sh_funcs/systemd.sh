sy() { sudo systemctl $@ }

die() { poweroff } 
re() { reboot }

rammax () {
	systemd-run --user --scope -p MemoryMax=$1 "${@:2}"
}
maxram() {
  rammax $@
}
ramax() {
  rammax $@
}

nobeep () {
	setterm -blength 0
}

killalltimers() {
  systemctl --user list-units --type=timer | grep run- | awk '{print $1}' | xargs -r systemctl --user stop
  systemctl --user list-units --type=timer | grep run- | awk '{print $1}' | xargs -r systemctl --user disable
}

