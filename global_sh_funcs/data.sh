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
  echo 'run this command in a $() to see the colors'
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

