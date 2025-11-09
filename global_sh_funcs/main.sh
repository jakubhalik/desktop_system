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

  wip() { echo "my IP: $(curl -s ipinfo.io/ip)" }
  it() {  nmap -Pn 86.49.243.46 -p 80,443,8080 }

  czt() { sudo timedatectl set-timezone  }Europe/Prague''

  ra() { openssl rand -base64 1000 }

  csz() { chsh -s /usr/bin/zsh }
  csd() { chsh -s /usr/bin/dash }

  cx() { cal_extended }
  m0() { cd ~/monitoring }

  m1() { htop | ste monitoring1.log }

  m2() { top | ste monitoring2.log }

  m3() { iostat -x 1 | ste monitoring3.log }

  m4() { vmstat 1 | ste monitoring4.log }

  m5() { sar -u 1 | ste monitoring5.log }

  m6() { netstat -tuln | ste monitoring6.log }

  m7() { sudo iftop | ste monitoring7.log }

  m8() { sudo nload | ste monitoring8.log }

  m9() { free -h | ste monitoring9.log }

  m10() { vmstat 1 5 | ste monitoring10.log }

  m11() { ps aux --sort=-%mem | head -n 10 | ste monitoring11.log }

  wd() { ne | grep Host }

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

  ct() { cd ~/d/g/gh/text_kuba }

  sd_obsolete() { /home/x/d/g/gh/scripts/save_dwm_layout.sh }

  rx_obsolete() { /home/x/d/g/gh/scripts/restart_xorg.sh }

  rl_obsolete() { /home/x/d/g/gh/scripts/restore_dwm_layout.sh }

  mw() { cd ~/m/work }

  l1() { ~/d/g/gh/scripts/lock_when_inactive_for_1_min.sh }

  l10() { ~/d/g/gh/scripts/lock_when_inactive_for_10_mins.sh }

  ke() { keepassxc }

  el() { elisa }

  th() { echo "192.168.0.32" }

  dfd() { df -h /dev/mapper/volgroup0-lv_home }

  dfr() { df -h /dev/mapper/volgroup0-lv_root }

  nem() { ne | grep Memory }

  fb() { ranger }

  #ran() { ranger }
  ran() { yz }

  da() { df -h|head -n 1;df -h|grep -E "root|home"; acpi; nem; }

  pi() { pixterm }

  img() { sxiv }

  imgs() { geeqie }

  rd() { shortwave }

  tra() { echo "trans -b :cs \"hi\"; trans -b :en \"jak je?\" " }

  vl() { vlock }

  lsc() { lscpu }

  pa() { grep -E "^(processor|cpu cores|siblings)" /proc/cpuinfo }

  fil() { ristretto }

  aud() { audacious }

  g() { cd /home/x/d/g }

  gg() { cd /home/x/d/g/g }

  glo() { grim /tmp/lockscreen.png; swaylock --image /tmp/lockscreen.png; rm /tmp/lockscreen.png }

  ho() { hyprlock }

  sho() { systemctl suspend; hyprlock }

  count() { echo "$(echo "$(ls -a|wc -l)-2"|bc) overall files/dirs in dir" }

  doc() { cd /home/x/d/g/gh/silixcon_REPOS/doc-docusaurus/docusaurus }
  dco() { cd /home/x/d/g/gh/silixcon_REPOS/doc-docusaurus/ }

  ns() { npm run start }

  sf() { cd /home/x/safepath }

  sft() { cd /home/x/safepath/temp }

  randombday() { printf "%02d/%02d/%d\n" $((RANDOM % 31 + 1)) $((RANDOM % 12 + 1)) $((RANDOM % (2005- 1980 + 1) + 1980)) }

  pstat() { ps aux|head -n1 }
  pstats() { ps aux|head -n1 }
  pst() { ps aux|head -n1 }

  clk() { xdotool click 1 }

  rp() { cd ~/d/g/g/recipes/ }

  torcurl() { curl --proxy socks5h://localhost:9050 }

  fa() { fastfetch --logo arch2 }

  nu() { cd ~/d/g/g/numbers }
  canu() { cat ~/d/g/g/numbers/numbers }
  canum() { cat ~/d/g/g/numbers/numbers }

  nuls="canu|grep -Ev  }([0-9].*){9}'"
  numls="canu|grep -Ev  }([0-9].*){9}'"

  dwdw() { cd ~/do/w }

  ds() { cd /mnt/disco }
  dsc() { cd /mnt/disco/disco }
  dsg() { cd /mnt/disco/g }
  dsm() { cd /mnt/disco/m }
  dsp() { cd /mnt/disco/p }
  dsv() { cd /mnt/disco/v }
  
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

