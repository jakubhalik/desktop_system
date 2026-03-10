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

#torip() { zsh -ic "cd ~/safepath/temp/; tcurl -s https://check.torproject.org|grep IP>tmp.html;w3m -dump -T text/html tmp.html>tmp_w3m;echo;cat tmp_w3m|sed 's/IP/tor IP/'| snt" }
torip () {
	tcurl -s https://check.torproject.org/api/ip | jq .IP
}
torwherestyledefault=false
torwherestyle() {
	TORIP=$(echo $(torip|tr -d '"')) 
	echo $TORIP | bat --theme ansi -l env
	torsocks geoiplookup $TORIP | blp
}
torwhere () {
  test "$torwherestyledefault" = true && ( torwherestyle ) || (
    TORIP=$(echo $(torip|tr -d '"')) 
    echo $TORIP
    torsocks geoiplookup $TORIP
  )
}

wb() { tcurl wttr.in/Brno }
wbb() { tcurl https://www.in-pocasi.cz/predpoved-pocasi/cz/jihomoravsky/brno-25/ }
wbc() { tcurl -s https://www.in-pocasi.cz/predpoved-pocasi/cz/jihomoravsky/brno-25/ | grep °C }
wbs() { tcurl -s https://www.in-pocasi.cz/predpoved-pocasi/cz/jihomoravsky/brno-25/ | grep -A 2 Slunce }

tw() { 
  echo "Real World Onion Sites, Dark.Fail, Ahmia.fi, Torch, Not Evil, Haystak, Onion Links, and The Hidden Wiki tor2web.nl onionengine.com" 
}

host_web_text_that_will_stop_being_hosted_after_being_fetched_once() {
  test $(echo $2) || (echo "Usage: $0 <plaintext to put on the website> <port to host on>" && exit 1)
  (
    echo "HTTP/1.1 200 OK"
    echo "Content-Length: $(echo $1|wc -c)"
    echo ""
    echo "$1"
  ) | nc -l -p $2
}

get_server() {
  test $(echo $2) || (echo "Usage: $0 <plaintext to put on the website> <port to host on>" && exit 1)
  dash -c '
    msg="$1"
    port="$2"
    while true; do
      {
        printf "HTTP/1.1 200 OK\r\n"
        printf "Content-Type: text/plain\r\n"
        printf "Content-Length: %s\r\n" "$(printf "%s" "$msg" | wc -c)"
        printf "\r\n"
        printf "%s" "$msg"
      } | nc -l -p "$port"
    done
  ' dash "$1" "$2"
}

clc() {
  curl localhost:$1
}
cl() {
  curl $1
}

c_test() {
  test $(echo $1) || (echo "Usage: $0 <port to be forever curling>" && exit 1)
  seq 1 99999999999999999999999999999999999999999999999999999999999999999999999|iter dash -c 'timeout 0.1s curl $1; echo {}' dash $1
}
cct() {c_test $@}
clc_test() {
  c_test localhost:$1
}

clct() {clc_test $@}

clp() {
  curl -X POST localhost:$1 -H "Content-Type: application/json" -d $2
}

clu() {
  curl -X PUT localhost:$1 -H "Content-Type: application/json" -d $2
}

# httpgetmess() {http_get_mess $@ }

countriesls() {
  test $1 = "-l" && (
    cat $path_to_encodings_tables_and_such/countries_long.md
  ) || cat $path_to_encodings_tables_and_such/countries.md
}
countries() {countriesls $@}
country() {
  test $1 = "-l" && (
    countries -l|head -n 1
    countries -l|ugrep -i $2
  ) || test $2 = "-l" && (
    countries -l|head -n 1
    countries -l|ugrep -i $1
  ) || (
    countries|head -n 1
    countries|ugrep -i $@
  )
}

