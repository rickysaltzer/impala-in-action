cat $1 | awk -F '\t' '

function to_timestamp(s) {
  day = substr(s,1,2) 
  month = "06"
  year = "1995"
  hh = substr(s,13,2)
  mm = substr(s,16,2)
  ss = substr(s,19,2)
  return "" year "-" month "-" day " " hh ":" mm ":" ss
}

{print $1"\t"to_timestamp($2)"\t"$3"\t"$4"\t"$5"\t"$6}'
