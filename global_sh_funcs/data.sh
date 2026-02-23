thousands() {
  echo "thousand, million, billion, trillion, quadrillion, quintillion, sextillion, septillion, octillion, nonillion, decillion, undecillion, duodecillion, tredecillion, quattuordecillion, quindecillion, sexdecillion, septendecillion, octodecillion, novemdecillion, vigintillion"
}

ks() {thousands}

perm() { 
  echo "| Permission  | Binary | Octal |\n| ----------- | ------ | ----- |\n| Read (r)    | \`100\`  | \`4\`   |\n| Write (w)   | \`010\`  | \`2\`   |\n| Execute (x) | \`001\`  | \`1\`   |" 
}

rights() {perm}

