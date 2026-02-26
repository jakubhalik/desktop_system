thousands() {
  echo "thousand, million, billion, trillion, quadrillion, quintillion, sextillion, septillion, octillion, nonillion, decillion, undecillion, duodecillion, tredecillion, quattuordecillion, quindecillion, sexdecillion, septendecillion, octodecillion, novemdecillion, vigintillion"
}

ks() {thousands}

perm() { 
  echo "| Permission  | Binary | Octal |\n| ----------- | ------ | ----- |\n| Read (r)    | \`100\`  | \`4\`   |\n| Write (w)   | \`010\`  | \`2\`   |\n| Execute (x) | \`001\`  | \`1\`   |" 
}

rights() {perm}

path_to_encodings_tables_and_such=$HOME/d/g/g/encodings

ansi() {
  cat $path_to_encodings_tables_and_such/ANSI.md
  echo 'run this command in a echo $() to see the colors'
}

ANSI() {ansi}
terminal_colors() {ansi}
terminal_cols() {ansi}
terminalcolors() {ansi}
terminalcol() {ansi}
colors_to_use_in_terminal() {ansi}

ascii() {
  cat $path_to_encodings_tables_and_such/ascii.md
}
asci() { ascii }

regex() {
  cat $path_to_encodings_tables_and_such/regex.md
}

num() { cd ~/d/g/g/numbers }
canu() { cat ~/d/g/g/numbers/numbers }
canum() { canu }

nuls() {
  canu|grep -Ev "([0-9].*){9}"
}

numls() {nuls}


