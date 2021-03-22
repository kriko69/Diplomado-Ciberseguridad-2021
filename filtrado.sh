dcat file.html | grep -E "num-votes|\"command\"" >> result.html

cat result.html | awk -F">|</div>" '{print $2}' >> data.txt

awk 'NR%2==0' data.txt >> votos.txt

awk 'NR%2==1' data.txt >> comandos.txt

awk '{if($1>=5) print NR}' votos.txt >> mayores.txt

cat mayores.txt | while read indice; do awk "NR==$indice" comandos.txtx; done

rm {result.html,data.txt,votos.txt,comandos.txt,mayores.txt}