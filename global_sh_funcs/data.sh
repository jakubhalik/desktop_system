path_to_encodings_tables_and_such=$HOME/d/g/g/encodings
path_to_notes=$HOME/d/g/g/obsidian-notes

thousands() {
  echo "thousand, million, billion, trillion, quadrillion, quintillion, sextillion, septillion, octillion, nonillion, decillion, undecillion, duodecillion, tredecillion, quattuordecillion, quindecillion, sexdecillion, septendecillion, octodecillion, novemdecillion, vigintillion"
}

ks() {thousands}

thousandss() {
  cat $path_to_notes/high_numbers
}
kss() {thousandss}

perm() { 
  echo "| Permission  | Binary | Octal |\n| ----------- | ------ | ----- |\n| Read (r)    | \`100\`  | \`4\`   |\n| Write (w)   | \`010\`  | \`2\`   |\n| Execute (x) | \`001\`  | \`1\`   |" 
}

rights() {perm}

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
speeds() {
  test $1 = "-l" && (
    cat $path_to_encodings_tables_and_such/speeds.md
  ) || (
    cat $path_to_encodings_tables_and_such/speeds.md | head -n 300
  )
}
headers() {
  test $1 = "--base" && (
    cat $path_to_encodings_tables_and_such/headers.md
  ) || test $1 = "-p" && (
    bat -l md --no-pager $path_to_encodings_tables_and_such/headers.md
  ) || (
    bat -l md $path_to_encodings_tables_and_such/headers.md
  )
}

num() { cd ~/d/g/g/numbers }
canu() { cat ~/d/g/g/numbers/numbers }
canum() { canu }

nuls() {
  canu|grep -Ev "([0-9].*){9}"
}

numls() {nuls}


