iter () {
	xargs -I{} $@
}
parseforiter() { tr ", " "\n" }

herepath=$HOME/d/g/g/desktop_system/global_sh_funcs
source $herepath/directories.sh
source $herepath/data.sh
source $herepath/ipandgeo.sh
source $herepath/containerization.sh
source $herepath/packaging.sh
source $herepath/parsing.sh
source $herepath/systemd.sh

count() { 
  if read -t "0.1"; then
    wc -l
  else
    echo "$(echo "$(ls -a|wc -l)-2"|bc) overall files/dirs in dir" 
  fi
}

common() { comm }
common_lines_between_files_or_inputs() { comm }

alias sudo='sudo-rs'

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
zs() { nv ~/.zshrc }
vz() { vim ~/.zshrc }
nvt() { nvim --cmd te }
alias nvimc='NVIM_APPNAME=nvimc nvim'

so() { source $@ }

t() { tee dev.log }

n() { npm run dev }
bu() { npm run build }
ns() { npm run start }
bd() { bun run dev }
bbu() { bun run build }

br() { brave }
savebrave() {
  rm ~/.config/BraveSoftware/Brave-Browser/SingletonLock
  rm ~/.config/BraveSoftware/Brave-Browser/SingletonCookie
  rm ~/.config/BraveSoftware/Brave-Browser/SingletonSocket
}

fir() { firefox -no-remote -ProfileManager }
to() { tor-browser }

aus() { yt-dlp -x --audio-format mp3 $@ }
vs() { yt-dlp bestvideo+bestaudio $@ }

au() { mpv --input-ipc-server=/tmp/mpvsocket $@ }
auv() { mpv --hwdec=qsv --input-ipc-server=/tmp/mpvsocket $@ }

ash() { au -shuffle *.mp3 }
ashv() { au -shuffle * }
ashh() { 
  find . -type f -iname "**" -print0 | shuf -z | xargs -0 mpv --input-ipc-server=/tmp/mpvsocket 
}

asn() { au -af scaletempo -speed $1 -shuffle *.mp3 }
ass() { asn 1.5 }

hi() { cat ~/.zsh_history }
he() { hi | hiremcrap }

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
cma() { commitamount }

math() { bc }
ma() { ma }

shct() { shotcut $@ }
gi() { gimp $@ }

ne() { neofetch }
nem() { ne | grep Memory }
da() { df -h|head -n 1;df -h|grep -E "root|home"; acpi; nem; }
howbig() { du -h $@ }

pdf_obsolete() { zathura $@ }
pdf() { mupdf $@ }
li() { libreoffice $@ }

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

ra() { openssl rand -base64 1000 }

csz() { chsh -s /usr/bin/zsh }
csd() { chsh -s /usr/bin/dash }

cx() { cal_extended }

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

pa() { grep -E "^(processor|cpu cores|siblings)" /proc/cpuinfo }
threads() {echo "$(nproc)*$(lscpu|grep "per core"|onlynums)"|bc}

architecture() {
	uname -m
}
arch() { architecture }
bit() { arch }

memtop () {
	htop -p $(pgrep -d, -f .)
}

lsfs() {df -T|grep root |awk '{print $2}'}
lsusers() {cat /etc/passwd}
lsusrs() {ls /home}
lsrealusrs() {lsusrs}
lsrealusers() {lsusrs}
ls_real_usrs() {lsusrs}
ls_rel_usrs() {lsusrs}
ls_home_users() {lsusrs}
lshomeusers() {lsusrs}
lshome() {lsusrs}
lsh() {lsusrs}
lshusrs() {lsusrs}
lshomeusrs() {lsusrs}
ls_home_usrs() {lsusrs}

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

alias bat='bat --theme ansi'
#ccat() { ccat --bg=dark $@ }

zfind() { find $herepath|sed '1d'|iter cat {}|grep $@ }


alias lsmimes="grep -hPo  }(?<=<mime-type type=\")[^\"]+' /usr/share/mime/packages/*.xml | sort -u"

iftmp() { 
  find tmp>/dev/null 2>&1 && echo "there already is a tmp file" || echo "there is no tmp file yet - proceeding normally" && 
}
istmpgon() { 
  find tmp>/dev/null 2>&1 && echo "somehow tmp file still here" || echo "tmp file rmed as should" 
}

vlcmin() { vlc --intf dummy $@ }

vidquality() {
	ffprobe -v error -select_streams v:0 -show_entries stream=width,height -of default=noprint_wrappers=1:nokey=1 $@
}
vidqual() {vidquality $@}
vidq() {vidquality $@}
imgquality () {
	file $@ | grep -oE '(^|[^0-9])[0-9]+ x [0-9]+' | grep -oE '[0-9]+ x [0-9]+'
}
imgqual() {imgquality $@}
imgq() {imgquality $@}
quality() {imgq || vidq $@}
qual() {quality $@}

table() {
  mousepad $@
}
tableview() { table $@ }

2onPow () {
	echo "2^$1" | bc | humnum
}
2onpow() {2onPow $@}
tonpow() {2onPow $@}

countlanglines() {
	fd -e $1 | xargs cat | wc -l
}
countrustlines() {countlanglines rs}
countrslines() {countrustlines}
cntrslines() {countrustlines}
cntrslns() {countrustlines}
countshlines() {countlanglines sh}
cntshlns() {countshlines}

# this is weird but gotta use this when running cargo tests so I can run a test after test, but the tests are absolutely not gonna run on a single thread, no , not if parallelism is implemented in them, so the funny thing is that to get to test parallelism that i implemented well, I have to use command that says one thread in it, but that is just stupid semantic cargo team decision, if i did not use this all tests would try to run unconditionally in parallel , but if my tests are supposed check how many times will for example 2 endpoints mating happen on a single core vs how many when using tokio than running just `cargo test` would return super flawed results, because all the cores would be used running diff tests when trying to measure how quickly does how much of a thing happen when i run it on all cores
testSequentially () {
	cargo test --release -- --nocapture --test-threads=1 $@
}
testseq() {testSequentially $@}
seqtest() {testSequentially $@}

filebrowse() {xplr}

tldrify_and_install() {
  randomzus=$RANDOM$RANDOM$RANDOM
  echo '
    tldrify() {
      cp $1.md ~/.cache/tldr/pages/common/$1.md
      cp $1.md ~/.cache/tlrc/pages.en/common/$1.md
    }
    tldrify $1
    read -sp "Enter sudo pass: " sudo_pass 
    cargo build --release
    echo "$sudo_pass" | sudo-rs -S install target/release/$1 /usr/bin/
  ' > /tmp/$randomzus
  chmod +x /tmp/$randomzus
  /tmp/$randomzus $1
  rm /tmp/$randomzus
}

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
snt() { 
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

