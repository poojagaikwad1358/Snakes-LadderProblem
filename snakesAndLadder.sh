#!/bin/bash -x

#constants
START_POS=0;
PLAYERS=1;

function diceRoll()
{
	random=$(( (RANDOM%6)+1 ))
	echo "Dice roll result: "$random
}
diceRoll
