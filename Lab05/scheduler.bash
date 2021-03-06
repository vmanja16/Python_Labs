#! /bin/bash
#
# $Author$
# $Date$
# $HeadURL$
# $Revision$

if (( $# != 1 )); then echo "Usage: ./scheduler.bash  <filename>";exit 1; fi
if [[ ! -r $1 ]]; then echo "Error: $1 is no readable!"; exit 2; fi
if [[ -e "schedule.out" ]]; then echo "ERROR: schedule.out already exists!"; exit 3; fi

touch schedule.out
echo "        07:00 08:00 09:00 10:00 11:00 12:00 13:00 14:00 15:00 16:00 17:00" >> schedule.out


while read -a Line
do
  LIST="- - - - - - - - - - -"
  LIST=($LIST)
  NAME=${Line[0]}
  i=0
  j=5
  for ((i=0; i< 12; i++))
  do
    (( j=j+1 ))
    if (( i==0 ));then continue;fi
    var=$(echo "${Line[1]}"|cut -f $i -d ","|cut -c 2)
    if [[ $var == $j || $var == "$j" ]]; then LIST[$i]="Y";fi
  done
 
  echo "$NAME ${LIST[0]}    ${LIST[1]}    ${LIST[2]}     ${LIST[3]}    ${LIST[4]}     ${LIST[5]}     ${LIST[6]}    ${LIST[7]}    ${LIST[8]}    ${LIST[9]}    ${LIST[10]}" >> schedule.out

done <$1


exit 0

