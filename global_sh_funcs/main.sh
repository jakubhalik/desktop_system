b() { linux-terminal-battery-status }
clo() { tty-clock }

al() { alsamixer }
asm() { amixer set Master }

nv() { nvim }
z() { nv ~/.zshrc }
vz() { vim ~/.zshrc }

so() { source }

sp() { sudo pacman }
i() { sp -S --needed }
u() { sp -Syu }
y() { yay }
ys() { y -S }
yu() { y -Syu }
mp() { makepkg -si }    
mc() { sudo make clean install }
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
fi() { firefox -no-remote -ProfileManager }
to() { tor-browser }

aus() { yt-dlp -x --audio-format mp3 }
vs() { yt-dlp bestvideo+bestaudio }

au() { mpv --input-ipc-server=/tmp/mpvsocket }
auv() { mpv --hwdec=qsv --input-ipc-server=/tmp/mpvsocket }

v() { cd ~/v }

ash() { au -shuffle *.mp3 }
ashv() { au -shuffle * }
ashh() { find . -type f -iname "**" -print0 | shuf -z | xargs -0 mpv --input-ipc-server=/tmp/mpvsocket }
ass() { au -af scaletempo -speed 1.5 -shuffle *.mp3 }

hi() { cat ~/.zsh_history }
he() { hi | hiremcrap }

sy() { sudo systemctl }

die() { poweroff } 
re() { reboot }

wi() { nmcli dev wifi }
we() { wi connect }

di() { dict }

le() { less }

cr() { clear }

lc() { locate }

e() { eval "\$(ssh-agent -s)" }
soa() { ssh-add ~/.ssh/github_ed25519 }
sog() { ssh-add ~/.ssh/gitlab_ed25519 }
ssg() { ssh-add ~/.ssh/silixcon_gitlab_ed25519 }
sst() { ssh -T git@github.com }

math() { bc }
ma() { ma }

shct() { shotcut }
gi() { gimp }

ne() { neofetch }
nem() { ne | grep Memory }
da() { df -h|head -n 1;df -h|grep -E "root|home"; acpi; nem; }

pdf_obsolete() { zathura }    
pdf() { mupdf }
li() { libreoffice }

dk() { docker-compose up --build -d }
gr() { docker exec -it gitlab-server gitlab-rails console }

ic() { ~/d/g/gh/scripts/download_all_vids_from_a_youtube_channel.sh }

bs() { acpi }

lsd() { lsblk }

f() { feh }
ff() { f --draw-filename }
ft() { feh -g 640x480 --auto-zoom --thumbnails }
nf() { feh --zoom 20 --draw-filename }
sxt() { sxiv -t }
mo() { mogrify -resize 800x800 -path }
pi() { pixterm }
img() { sxiv }
imgs() { geeqie }
glo() { grim /tmp/lockscreen.png; swaylock --image /tmp/lockscreen.png; rm /tmp/lockscreen.png }

wip() { echo "my IP: $(curl -s ipinfo.io/ip)" }
it() {  nmap -Pn 86.49.243.46 -p 80,443,8080 }

czt() { sudo timedatectl set-timezone  }Europe/Prague''

ra() { openssl rand -base64 1000 }

csz() { chsh -s /usr/bin/zsh }
csd() { chsh -s /usr/bin/dash }

cx() { cal_extended }
bit() { uname -m }

tw() { echo "Real World Onion Sites, Dark.Fail, Ahmia.fi, Torch, Not Evil, Haystak, Onion Links, and The Hidden Wiki tor2web.nl onionengine.com" }

wb() { tcurl wttr.in/Brno }
wbb() { curl https://www.in-pocasi.cz/predpoved-pocasi/cz/jihomoravsky/brno-25/ | nv }
wbc() { curl https://www.in-pocasi.cz/predpoved-pocasi/cz/jihomoravsky/brno-25/ | grep °C | nv }
wbs() { curl https://www.in-pocasi.cz/predpoved-pocasi/cz/jihomoravsky/brno-25/ | grep -A 2 Slunce | nv }

ce() { crontab -e }
crl() { crontab -l }

km() { ~/d/g/gh/scripts/kill_music.sh }

ti() { ~/d/g/gh/scripts/timer.sh }
td() { ~/d/g/gh/scripts/timer_dynamic.sh }

el() { elisa }
rd() { shortwave }
fil() { ristretto }
aud() { audacious }

dfd() { df -h /dev/mapper/volgroup0-lv_home }
dfr() { df -h /dev/mapper/volgroup0-lv_root }

#ran() { ranger }
ran() { yz }

tra() { echo "trans -b :cs \"hi\"; trans -b :en \"jak je?\" " }

pa() { grep -E "^(processor|cpu cores|siblings)" /proc/cpuinfo }

ho() { hyprlock }
sho() { systemctl suspend; hyprlock }

randombday() { printf "%02d/%02d/%d\n" $((RANDOM % 31 + 1)) $((RANDOM % 12 + 1)) $((RANDOM % (2005- 1980 + 1) + 1980)) }

pstat() { ps aux|head -n1 }
pstats() { pstat }
pst() { pstat }

clk() { xdotool click 1 }

torcurl() { curl --proxy socks5h://localhost:9050 $@ }
tcurl () { torcurl $@ }

fa() { fastfetch --logo arch2 }

nu() { cd ~/d/g/g/numbers }
canu() { cat ~/d/g/g/numbers/numbers }
canum() { cat ~/d/g/g/numbers/numbers }
nuls="canu|grep -Ev  }([0-9].*){9}'"
numls="canu|grep -Ev  }([0-9].*){9}'"

lss() { ls --color }
lsc() { ls --color }

perm() { echo "| Permission  | Binary | Octal |\n| ----------- | ------ | ----- |\n| Read (r)    | \`100\`  | \`4\`   |\n| Write (w)   | \`010\`  | \`2\`   |\n| Execute (x) | \`001\`  | \`1\`   |" }

w3mi() { w3m -o auto_image=TRUE }
tw3mi() { torsocks w3m -o auto_image=TRUE }

twm() { torsocks w3m -o auto_image=TRUE }

nonohup() { find .|grep nohup.out && echo "there is an nohup.out file" || echo "\nthere is not a nohup.out file anywhere I can access without sudo in /home/x" }

grepr() { ~/d/g/g/scripts/grepr.sh }
grpr() { ~/d/g/g/scripts/grepr.sh }
lsr() { ~/d/g/g/scripts/lsr.sh }
lsrr() { ~/d/g/g/scripts/lsrr.sh }

bat() { bat --theme ansi }

ts() { torsocks }

ccat() { ccat --bg=dark }

zfind() { cat ~/.zshrc|grep }

synthigh() { ~/d/g/g/scripts/synthigh.sh }
synt() { ~/d/g/g/scripts/synthigh.sh }
snt() { ~/d/g/g/scripts/synthigh.sh }

trans() { torsocks trans }

lsmimes="grep -hPo  }(?<=<mime-type type=\")[^\"]+' /usr/share/mime/packages/*.xml | sort -u"

nvt() { nvim --cmd te }

proxies() { cat ~/d/g/g/proxies/anonymous_proxies|snt; echo "You have $(echo $(cat ~/d/g/g/proxies/anonymous_proxies|wc -l)-1|bc|snt) anonymous proxies available :-)" }

torip() { zsh -ic "cd ~/safepath/temp/; tcurl -s https://check.torproject.org|grep IP>tmp.html;w3m -dump -T text/html tmp.html>tmp_w3m;echo;cat tmp_w3m|snt" }

ispac() { pacman -Q| grep }

iftmp() { find tmp>/dev/null 2>&1 && echo "there already is a tmp file" || echo "there is no tmp file yet - proceeding normally" && }

istmpgon() { find tmp>/dev/null 2>&1 && echo "somehow tmp file still here" || echo "tmp file rmed as should" }

isproc() { ps aux|grep }

vlcmin() { vlc --intf dummy }

clearcach() { echo "pacman -Sc or yay -Sc" }

