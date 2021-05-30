Bowling Game Kata
=================

[bowling-score]: http://www.wpclipart.com/recreation/sports/bowling/bowling_scoresheet_example.png "bowling score card"
![Bowling scoreboard][bowling-score]

## Bowling Rules

The game consists of 10 frames. In each frame the player has two rolls to knock down 10 pins. The score for the frame is the total number of pins knocked down, plus bonuses for strikes and spares.

A spare is when the player knocks down all 10 pins in two rolls. The bonus for that frame is the number of pins knocked down by the next roll.

A strike is when the player knocks down all 10 pins on his first roll. The frame is then completed with a single roll. The bonus for that frame is the value of the next two rolls.

In the tenth frame a player who rolls a spare or strike is allowed to roll the extra balls to complete the frame. However no more than three balls can be rolled in tenth frame.

## Requirements

* Write class "Game" that has two methods
	- *void roll(int)*
		- called each time the player rolls a ball. The argument is the number of pins knocked down.
	- *int score()*
		- called only after the very end of the game. Returns total score of the game.

## 3 versions of the kata:
- 1st version of the kata (no constraints)
- 2nd version of the kata (Fonctional Programming)
- 3rd version of the kata (no if statement)