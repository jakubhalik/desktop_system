iter () {
	xargs -I{} $@
}
parseforiter() { tr ", " "\n" }

herepath=$HOME/d/g/g/desktop_system/global_sh_funcs
sourcethese="directories, geo, data, complex_containeraztion"
source $(echo $sourcethese|parseforiter|iter echo $herepath/{}.sh)
source $herepath/directories.sh
source $herepath/data.sh
source $herepath/geo.sh

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

common() { comm }
common_lines_between_files_or_inputs() { comm }

b() { linux-terminal-battery-status }
clo() { tty-clock }

al() { alsamixer }
asm() { 
  amixer set Master $1%
}

bl() {
  bat -l conf
}
blp() {
  bat -l conf --no-pager
}

nv() { nvim $@ }
z() { nv ~/.zshrc }
vz() { vim ~/.zshrc }
nvt() { nvim --cmd te }

so() { source $@ }

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

t() { tee dev.log }

n() { npm run dev }
bu() { npm run build }
ns() { npm run start }
bd() { bun run dev }
bbu() { bun run build }

br() { brave }
fir() { firefox -no-remote -ProfileManager }
to() { tor-browser }

aus() { yt-dlp -x --audio-format mp3 $@ }
vs() { yt-dlp bestvideo+bestaudio $@ }

au() { mpv --input-ipc-server=/tmp/mpvsocket $@ }
auv() { mpv --hwdec=qsv --input-ipc-server=/tmp/mpvsocket $@ }

v() { cd ~/v }

ash() { au -shuffle *.mp3 }
ashv() { au -shuffle * }
ashh() { 
  find . -type f -iname "**" -print0 | shuf -z | xargs -0 mpv --input-ipc-server=/tmp/mpvsocket 
}

asn() { au -af scaletempo -speed $1 -shuffle *.mp3 }
ass() { asn 1.5 }

hi() { cat ~/.zsh_history }
he() { hi | hiremcrap }

sy() { sudo systemctl $@ }

die() { poweroff } 
re() { reboot }

rammax () {
	systemd-run --user --scope -p MemoryMax=$1 "${@:2}"
}

nobeep () {
	setterm -blength 0
}

wi() { nmcli dev wifi $@ }
we() { wi connect $@ }

di() { dict $@ }

le() { less }

cr() { clear }

lc() { locate $@ }

start_ssh_keys_sess() { 
  eval $(ssh-agent -s) 
}
e() { start_ssh_keys_sess }

soa() { ssh-add ~/.ssh/github_ed25519 }
sog() { ssh-add ~/.ssh/gitlab_ed25519 }
ssg() { ssh-add ~/.ssh/silixcon_gitlab_ed25519 }
sst() { ssh -T git@github.com }

commitamount() {
  git log|grep commit|wc -l
}
commitcount() { commitamount }
comitcount() { commitamount }
comitamount() { commitamount }

math() { bc }
ma() { ma }

shct() { shotcut $@ }
gi() { gimp $@ }

ne() { neofetch }
nem() { ne | grep Memory }
da() { df -h|head -n 1;df -h|grep -E "root|home"; acpi; nem; }

pdf_obsolete() { zathura $@ }
pdf() { mupdf $@ }
li() { libreoffice $@ }

dk() { docker-compose up --build -d $@ }
gr() { docker exec -it gitlab-server gitlab-rails console }

ic() { 
  ~/d/g/g/scripts/download_all_vids_from_a_youtube_channel.sh $@ 
}

bs() { acpi }

f() { feh $@ }
ff() { f --draw-filename $@ }
ft() { feh -g 640x480 --auto-zoom --thumbnails $@ }
nf() { feh --zoom 20 --draw-filename $@ }
sxt() { sxiv -t $@ }
mo() { mogrify -resize 800x800 -path $@ }
pi() { pixterm $@ }
img() { sxiv $@ }
imgs() { geeqie $@ }
glo() { grim /tmp/lockscreen.png; swaylock --image /tmp/lockscreen.png; rm /tmp/lockscreen.png }

wip() { 
  echo "my IP: $(curl -s ipinfo.io/ip)" 
}
#it() {  nmap -Pn 86.49.243.46 -p 80,443,8080 } # wtf ????????? no idea what was this shit and why it had the no sense making generic name

clc() {
  curl localhost:$1
}

ra() { openssl rand -base64 1000 }

csz() { chsh -s /usr/bin/zsh }
csd() { chsh -s /usr/bin/dash }

cx() { cal_extended }

tw() { 
  echo "Real World Onion Sites, Dark.Fail, Ahmia.fi, Torch, Not Evil, Haystak, Onion Links, and The Hidden Wiki tor2web.nl onionengine.com" 
}
ts() { torsocks }
torcurl() { curl --proxy socks5h://localhost:9050 $@ }
tcurl () { torcurl $@ }
w3mi() { w3m -o auto_image=TRUE $@ }
tw3mi() { torsocks w3m -o auto_image=TRUE $@ }
twm() { torsocks w3m -o auto_image=TRUE $@ }
trans() { torsocks trans $@ }
proxies() { 
  cat ~/d/g/g/proxies/anonymous_proxies|snt; 
  echo "You have $(echo $(cat ~/d/g/g/proxies/anonymous_proxies|wc -l)-1|bc|snt) anonymous proxies available :-)" 
}
torip() { zsh -ic "cd ~/safepath/temp/; tcurl -s https://check.torproject.org|grep IP>tmp.html;w3m -dump -T text/html tmp.html>tmp_w3m;echo;cat tmp_w3m|sed 's/IP/tor IP/'| snt" }

wb() { tcurl wttr.in/Brno }
wbb() { tcurl https://www.in-pocasi.cz/predpoved-pocasi/cz/jihomoravsky/brno-25/ }
wbc() { tcurl -s https://www.in-pocasi.cz/predpoved-pocasi/cz/jihomoravsky/brno-25/ | grep °C }
wbs() { tcurl -s https://www.in-pocasi.cz/predpoved-pocasi/cz/jihomoravsky/brno-25/ | grep -A 2 Slunce }

ce() { crontab -e }
crl() { crontab -l }

km() { 
  $(ps aux | grep '[m]player' | awk '{print $2}')|iter kill -9 {}
}

el() { elisa }
rd() { shortwave }
fil() { ristretto }
aud() { audacious }

dfd() { df -h /dev/mapper/volgroup0-lv_home }
dfr() { df -h /dev/mapper/volgroup0-lv_root }

#ran() { ranger }
ran() { yz }

tra() { 
  echo "trans -b :cs \"hi\"; trans -b :en \"jak je?\" " 
}

pa() { grep -E "^(processor|cpu cores|siblings)" /proc/cpuinfo }
threads() {echo "$(nproc)*$(lscpu|grep "per core"|onlynums)"|bc}

architecture() {
	uname -m
}
arch() { architecture }
bit() { arch }

lsfs() {df -T|grep root |awk '{print $2}'}
lsusers() {cat /etc/passwd}

ho() { hyprlock }
sho() { systemctl suspend; hyprlock }

randombday() { printf "%02d/%02d/%d\n" $((RANDOM % 31 + 1)) $((RANDOM % 12 + 1)) $((RANDOM % (2005- 1980 + 1) + 1980)) }

pstat() { ps aux|head -n1 }
pstats() { pstat }
pst() { pstat }

isproc() { ps aux|grep $@ }

allproc() {ps aux}
allprocs() {allproc}

procsamount() {allproc|wc -l}
procamount() { procsamount }

clk() { xdotool click 1 }

fa() { fastfetch --logo arch2 }


nu() { cd ~/d/g/g/numbers }
canu() { cat ~/d/g/g/numbers/numbers }
canum() { cat ~/d/g/g/numbers/numbers }

nuls() {
  canu|grep -Ev  "([0-9].*){9}"
}

numls() {nuls}

lss() { ls --color }
lsc() { ls --color }

nonohup() { 
  find .|grep "nohup.out" && echo "there is a nohup.out file" || echo "\nthere is not a nohup.out file anywhere I can access without sudo in /home/x" 
}

grepr() { 
 grep -r --color=always "$1" | sed -E "s/($1)/\x1b[31m\1\x1b[0m/g"
}
grpr() { grepr $@ }
lsr() { 
  ls |grep "$1" | sed -E "s/($1)/\x1b[31m\1\x1b[0m/g"
}
lsrr() { 
  ls -R |grep "$1" | sed -E "s/($1)/\x1b[31m\1\x1b[0m/g"
}

bat() { bat --theme ansi $@ }
#ccat() { ccat --bg=dark $@ }

zfind() { cat ~/.zshrc|grep }


alias lsmimes="grep -hPo  }(?<=<mime-type type=\")[^\"]+' /usr/share/mime/packages/*.xml | sort -u"

iftmp() { 
  find tmp>/dev/null 2>&1 && echo "there already is a tmp file" || echo "there is no tmp file yet - proceeding normally" && 
}
istmpgon() { 
  find tmp>/dev/null 2>&1 && echo "somehow tmp file still here" || echo "tmp file rmed as should" 
}

vlcmin() { vlc --intf dummy $@ }

synthigh() { 
  # Define ANSI color codes
  # Using literal escape sequences for sed
  red='\x1b[31m'
  green='\x1b[32m'
  yellow='\x1b[1;33m'
  purple='\e[1;35m'
  blue='\x1b[34m'
  magenta='\x1b[35m'
  cyan='\x1b[36m'
  reset='\x1b[0m'

  # Each 's' command performs a substitution.
  # Order matters! For example, highlight comments *before* keywords to avoid issues.
  sed -E "
  # 1. Highlight comments (starting with # to end of line) - apply before other rules
  s/(^|\s)(#.*)/\\1${magenta}\\2${reset}/g;

  s/\b(if|then|else|elif|fi|for|in|do|done|while|until|function|return|export|local|declare|case|esac|break|continue|select|trap|read|set|unset|true|false)\b/${red}\1${reset}/g;

  s/\b(echo|print|printf|cat|grep|sed|awk|cut|find|xargs|ls|cd|pwd|mv|cp|rm|mkdir|rmdir|touch|man|help|sudo|ssh|scp|git|curl|wget|python|node|npm|ruby|perl|go|java|gcc|make|configure)\b/${blue}\1${reset}/g;

  s/(\b[0-9]+(\.[0-9]+)?\b)/${yellow}\1${reset}/g;

  # variables (e.g., $VAR, ${VAR})
  s/(\$[a-zA-Z_][a-zA-Z0-9_]*|\$\{[a-zA-Z_][a-zA-Z0-9_]*\})/${cyan}\1${reset}/g;

  # quoted strings (single or double quotes)
  # This is tricky with sed ; simple approach here.
  s/(\"[^\"]*\")|('[^']*')/${green}\1${reset}/g;

  "
}
synt() { 
  synthigh
}
synt() { 
  synt
}

# bash syntax
# ti() { 
#   seconds=0
#   while true; do
#     clear
#     printf "%02d:%02d:%02d\n" $((seconds/3600)) $((seconds/60%60)) $((seconds%60))
#     sleep 1
#     seconds=$((seconds+1))
#   done
# }
# td() {
#   read -sp 'What is the timer for: ' timer_purpose
#
#   seconds=0
#
#   while true; do
#     clear
#     printf "$timer_purpose: %02d:%02d:%02d\n" $((seconds/3600)) $((seconds/60%60)) $((seconds%60))
#     sleep 1
#     seconds=$((seconds+1))
#   done
# }
# zsh syntax
#
ti() {
  local seconds=0
  while true; {
    clear
    printf "%02d:%02d:%02d\n" $((seconds/3600)) $((seconds/60%60)) $((seconds%60))
    sleep 1
    seconds=$((seconds + 1))
  }
}

td() {
  local timer_purpose
  read "timer_purpose?What is the timer for: "

  local seconds=0

  while true; {
    clear
    printf "%s: %02d:%02d:%02d\n" "$timer_purpose" $((seconds/3600)) $((seconds/60%60)) $((seconds%60))
    sleep 1
    seconds=$((seconds + 1))
  }
}

