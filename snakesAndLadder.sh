#!/bin/bash -x

#Constants
START_POS=0;
PLAYERS=1;
NO_PLAY=1;
LADDER=2;
SNAKE=3;

#Variables
position=$START_POS

#Rolling dice to get number between 1 to 6
function diceRoll()
{
	random=$(( (RANDOM % 6) +1 ))
	echo "Dice roll result: "$random
}

#Function to get no play, ladder & snake
function playing()
{
	choice=$(( (RANDOM % 3) +1 ))
	diceRoll

	case $choice in
		$NO_PLAY)
			echo "No move player have same position."
			;;
		$LADDER)
			position=$(( $position + $random ))
			echo "You got Ladder move forword by $position."
			;;
		$SNAKE)
			position=$(( $position - $random ))
			if [ $position -lt 0 ]
			then
				position=$START_POS
			fi
			echo "You got Snake move backward by $position."
			;;
	esac
}

#Performing continuous playing to reach at 100 position
while [ $position -lt 100 ]
do
	playing
done
