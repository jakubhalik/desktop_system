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

