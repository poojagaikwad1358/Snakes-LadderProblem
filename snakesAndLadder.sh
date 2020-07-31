#!/bin/bash -x

#constants
START_POS=0;
PLAYERS=1;
NO_PLAY=1;
LADDER=2;
SNAKE=3;

#variables
position=$START_POS

#rolling dice to get number between 1 to 6
function diceRoll()
{
	random=$(( (RANDOM%6)+1 ))
	echo "Dice roll result: "$random
}

#Function to get no play,ladder,snake
function playing(){
	choice=$(($((RANDOM%3))+1))
	diceRoll
	case $choice in
		$NO_PLAY)
			echo "No move player have same position"
			;;
		$LADDER)
			position=$(($position+$random))
			echo "got Ladder move forword by $position"
			;;
		$SNAKE)
			position=$(($position-$random))
			echo "got Snake move backward by $position"
			;;
	esac
}
playing
