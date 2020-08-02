#!/bin/bash -x

#Constants
START_POS=0;
PLAYERS=1;
NO_PLAY=1;
LADDER=2;
SNAKE=3;

#Variables
position=$START_POS
noOfDiceRolls=0

#Rolling dice to get number between 1 to 6.
function diceRoll()
{
	random=$(( (RANDOM % 6) +1 ))
	echo "Dice roll result: "$random

	#Get how many times dice roll to win game
	noOfDiceRolls=$(( $noOfDiceRolls + 1 ))
}

#Function to get no play, ladder & snake.
function playing()
{
	choice=$(( (RANDOM % 3) +1 ))
	diceRoll

	case $choice in
		$NO_PLAY)
			echo "No move player have same position."
			;;
		$LADDER)
			#Performing operation to get exact winning position 100.
			temp=$(( $position + $random ))
			if [ $temp -gt 100 ]
			then
				echo "You can't move."
			else
				position=$temp
				echo "You got Ladder move forword by $position."
			fi
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

#Performing continuous playing to reach at 100 position.
while [ $position -lt 100 ]
do
	playing
done

echo "Total number of times dice rolls: "$noOfDiceRolls
