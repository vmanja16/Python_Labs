#! /bin/bash
#
# $Author$
# $Date$
# $HeadURL$
# $Revision$

if (( $# != 0 )); then echo "Usage: ./hangman,bash";exit 1; fi

List=("banana" "parsimonious" "sesquidepalian")

((CHOICE=$RANDOM%3))

WORD=${List[$CHOICE]}

LENGTH=$(echo $WORD|wc -c)
(( LENGTH = (LENGTH-1) ))

echo "Your word is $LENGTH letters long"
GUESS=()
for (( i =0; i< LENGTH;i++ ))
do
  GUESS[i]="."
done

x=0

while (( $x==0 ))
do
  FLAG=0
  NAME=""
  for (( i =0; i< LENGTH;i++ ))
  do
    NAME+=${GUESS[$i]}
  done

 if [[ $NAME = $WORD ]];then
    echo "Congratulations! You guessed the word $WORD";exit 0
  fi
  echo "Word is $NAME"
  read -p "Make a guess: " LETTER </dev/tty
  for (( i =0; i< LENGTH;i++ ))
  do
    if [[ $LETTER == ${WORD:$i:1} ]];then
      GUESS[$i]=$LETTER
      FLAG=1
    fi

  done
  
  if (( $FLAG == 1 ));then
    echo "Good Going"
  else echo "Sorry try again!"
  fi 
done



