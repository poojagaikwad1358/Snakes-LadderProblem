#!/bin/bash -x

#dictionary array
declare -a players

#Constants
START_POS=0;
NO_PLAY=1;
LADDER=2;
SNAKE=3;

#Variables
noOfDiceRolls=0
noOfPlayers=2

for(( i=1; i<=$noOfPlayers; i++ ))
do
	players[$i]=0;
done

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
			temp=$(( ${players[key]} + $random ))
			if [ $temp -gt 100 ]
			then
				echo "You can't move."
			else
				players[$key]=$temp
				echo "You got Ladder move forword by ${players[$key]}."
				if [ ${players[$key]} -ne 100 ]
				then
					playing
				fi
			fi
			;;
		$SNAKE)
			players[$key]=$(( ${players[$key]} - $random ))
			if [ ${players[$key]} -lt 0 ]
			then
				players[$key]=$START_POS
			fi
			echo "You got Snake move backward by ${players[$key]}."
			;;
	esac
}

#variables
flag=0

#Performing operation to display turn & winner.
while [ $flag -ne 1 ]
do
	for key in ${!players[@]}
	do
		echo "Player $key turn"
		playing
		if [ ${players[$key]} -eq 100 ]
		then
			flag=1
			echo "Player $key wins."
			break;
		fi
	done
done

echo "Total number of times dice rolls: "$noOfDiceRolls

#Displaying players current position.
echo "Current positions of players are: "
for key in ${!players[@]}
do
	echo "Players $key": ${players[$key]}
done
