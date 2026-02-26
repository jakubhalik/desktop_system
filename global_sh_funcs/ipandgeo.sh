timezones() {
  timedatectl list-timezones
}

czt() { sudo timedatectl set-timezone Europe/Prague }

wi() { nmcli dev wifi $@ }
we() { wi connect $@ }

wip() { 
  echo "my IP: $(curl -s ipinfo.io/ip)" 
}
#it() {  nmap -Pn 86.49.243.46 -p 80,443,8080 } # wtf ????????? no idea what was this shit and why it had the no sense making generic name

clc() {
  curl localhost:$1
}

ts() { torsocks }
torcurl() { curl --proxy socks5h://localhost:9050 $@ }
tcurl () { torcurl $@ }

w3mi() { w3m -o auto_image=TRUE $@ }
tw3mi() { torsocks w3m -o auto_image=TRUE $@ }
twm() { torsocks w3m -o auto_image=TRUE $@ }

trans() { torsocks trans $@ }
tra() { 
  echo "trans -b :cs \"hi\"; trans -b :en \"jak je?\" " 
}

proxies() { 
  cat ~/d/g/g/proxies/anonymous_proxies|snt; 
  echo "You have $(echo $(cat ~/d/g/g/proxies/anonymous_proxies|wc -l)-1|bc|snt) anonymous proxies available :-)" 
}

torip() { zsh -ic "cd ~/safepath/temp/; tcurl -s https://check.torproject.org|grep IP>tmp.html;w3m -dump -T text/html tmp.html>tmp_w3m;echo;cat tmp_w3m|sed 's/IP/tor IP/'| snt" }

wb() { tcurl wttr.in/Brno }
wbb() { tcurl https://www.in-pocasi.cz/predpoved-pocasi/cz/jihomoravsky/brno-25/ }
wbc() { tcurl -s https://www.in-pocasi.cz/predpoved-pocasi/cz/jihomoravsky/brno-25/ | grep °C }
wbs() { tcurl -s https://www.in-pocasi.cz/predpoved-pocasi/cz/jihomoravsky/brno-25/ | grep -A 2 Slunce }

tw() { 
  echo "Real World Onion Sites, Dark.Fail, Ahmia.fi, Torch, Not Evil, Haystak, Onion Links, and The Hidden Wiki tor2web.nl onionengine.com" 
}

countriesls() {
  cat $path_to_encodings_tables_and_such/countries.md
}
countries() {countriesls}
country() {
  countries|head -n 1
  countries|ugrep -i $@
}

