extends Node
# Just a script for storing global variables so that the scenes can communicate with each other

# The current level by default is 1.
# This will be used by the timer in the card scene in order to set the length of the timer
var currentLevel : int = 1

# Used to check if the number selected is the correct number.
# No number selected by default, should only be 0 through 9. -1 is a placeholder to signal
# that nothing has been chosen
var numberSelected : int = -1

var cardGameStarted : bool = false
var cardSelectorEnable : bool = false

# This resets to zero every new level. Used to display how many cards the player has gotten correct.
var cardsCorrect : int = 0

# Used to keep track of how many cards have been guessed by the player  
var cardsGuessed : int = 0

# Variables for keeping track of the options the player has chosen, and which side they lean towards.
var keepBody : int = 0
var newBody : int = 0

var dialougeDone : bool = false
