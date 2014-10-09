SEP=$'\t'
country=""
get_country() {
  host=$1
  country=""
  last=`echo $host | awk -F'.' '{print $NF}'`
  case $last in 
	"arpa"  ) country="US${SEP}United States";;
	"at"  ) country="AT${SEP}Austria";;
	"au"  ) country="AU${SEP}Australia";;
	"be"  ) country="BE${SEP}Belgium";;
	"br"  ) country="BR${SEP}Brazil";;
	"ca"  ) country="CA${SEP}Canada";;
	"ch"  ) country="CH${SEP}Switzerland";;
	"cr"  ) country="CR${SEP}Costa Rica";;
	"cz"  ) country="CZ${SEP}Czech Republic";;
	"de"  ) country="DE${SEP}Germany";;
	"dk"  ) country="DK${SEP}Denmark";;
	"es"  ) country="ES${SEP}Spain";;
	"fi"  ) country="FI${SEP}Finland";;
	"fr"  ) country="FR${SEP}France";;
	"gov"  ) country="US${SEP}United States";;
	"gr"  ) country="GR${SEP}Greece";;
	"id"  ) country="ID${SEP}Indonesia";;
	"ie"  ) country="IE${SEP}Ireland";;
	"il"  ) country="IL${SEP}Israel";;
	"it"  ) country="IT${SEP}Italy";;
	"jp"  ) country="JP${SEP}Japan";;
	"kr"  ) country="KR${SEP}Korea";;
	"kw"  ) country="KW${SEP}Kuwait";;
	"lu"  ) country="LU${SEP}Luxembourg";;
	"lv"  ) country="LV${SEP}Latvia";;
	"mx"  ) country="MX\Mexico";;
	"my"  ) country="MY${SEP}Malaysia";;
	"nl"  ) country="NL${SEP}Netherlands";;
	"no"  ) country="NO${SEP}Norway";;
	"nz"  ) country="NZ${SEP}New Zealand";;
	"ph"  ) country="PH${SEP}Philippines";;
	"pt"  ) country="PT${SEP}Portugal";;
	"ru"  ) country="RU${SEP}Russian Federation";;
	"se"  ) country="SE${SEP}Sweden";;
	"sg"  ) country="SG${SEP}Singapore";;
	"su"  ) country="SU${SEP}Russian Federation";;
	"uk"  ) country="UK${SEP}United Kingdom";;
	"us"  ) country="US${SEP}United States";;
	"za"  ) country="ZA${SEP}South Africa";;
	* ) country="${SEP}";;
  esac
}


#
# REQUIREMENT: freegeoip is running locally on port 8080 
#
while IFS=$'\t' read host date req response size
do
# host host ip city_name lon lat country_code country_name
  domain=`curl -s http://localhost:8080/csv/$host | awk -F "," '{print $1,"\t",$6,"\t",$8,"\t",$9,"\t",$2,"\t",$3}' | sed 's/"//g'`
  notfound=`echo $domain | sed 's/[[:space:]]*//g'`
  if [ "$notfound" == "NotFound" ];
  then 
    get_country $host
    echo "$host${SEP}${SEP}${SEP}${SEP}${SEP}$country"
  else
    echo "$host${SEP}$domain"
  fi
done < $1
