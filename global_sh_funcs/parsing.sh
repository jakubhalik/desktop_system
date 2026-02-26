humannums() {rev | sed 's/.../& /g' | rev|sed 's/^ //'}
humnums() {humannums}
humnum() {humnums}

onlynums() {sed 's/[^0-9]//g'}
onlynum() {onlynums}

remspaces() {
  tr -d " "
}

between () {
	sed -n "s/.*${1}\(.*\)${2}.*/\1/p"
}

rmstdinfromtoEOF () {
	sed "s/$1.*//"
}
