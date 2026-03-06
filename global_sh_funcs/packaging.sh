sp() { sudo pacman $@ }
i() { sp -S --needed $@ }
u() { sp -Syu }
y() { yay $@ }
ys() { y -S $@ }
yu() { y -Syu $@ }
mp() { makepkg -si $@ }
mc() { sudo make clean install $@ }

uninstall () {
	sudo rm $(which $1)
}

instal () {
	sudo install $1 /usr/bin/
}

ispac() { 
  pacman -Q| grep $@
}

isbin() {
  ls /usr/bin | grep $@
}

lsbin () {
  ls /usr/bin
}

clearcach() { 
  echo "pacman -Sc or yay -Sc" 
}

pakstat() { 
  echo "echo \"\nall packages: $(pacman -Q|wc -l)\"; 
  pacman -Q|wc -l;echo \"\nexplicitly installed: $(pacman -Qe|wc -l)\";
  pacman -Qe|wc -l;echo \"\n\tthose of them with pacman: $(pacman -Qqen|wc -l)\n\t$(pacman -Qqen|wc -l)\";  
  echo \"\ndependencies of the explicitly installed: $(pacman -Qqd|wc -l)\"; pacman -Qqd|wc -l;
  echo \"\nDONT KNOW WHAT THIS FLAG SHOWS: $(pacman -Qt|wc -l)\";  pacman -Qt|wc -l;
  echo \"\nforeign packages (not from pacman - is from AUR, or manually installed): $(pacman -Qm|wc -l)\";pacman -Qm|wc -l;
  echo">~/safepath/temp/tmp.sh;chmod +x ~/safepath/temp/tmp.sh; ~/safepath/temp/tmp.sh|bat -l conf; rm ~/safepath/temp/tmp.sh 
}

license() {
  pacman -Si $1 | ugrep License
}

licensey() {
  yay -Si $1 | ugrep License
}
licensy() {licensey}
