extends Node2D

var cardNum : int # Stores the number of the card
var timerSetOff : bool = false # Signals when the timer has been set off in order to check for mouse input.
var mouseOnCard : bool = false 
var guessed : bool = false # The user can only guess which number they think a card is once.
var replay : bool = false

# The numbers of the cards should be established from the start of the scene, but they shouldn't change afterwards.
func _ready():
	$CardAnimatedSprite.set_animation("Cards")
	$CardAnimatedSprite.set_frame(10)
	replay = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
# We don't need to use delta here which is why theres a '_' in front of it.
func _process(_delta):
	if GlobalVars.cardGameStarted == true and replay != true:
		startGame()
		replay = true
	
	if timerSetOff and mouseOnCard and Input.is_action_just_pressed("left_mouse_button") and guessed == false:
		checkInput()

func checkInput():
	if GlobalVars.numberSelected != -1:
		GlobalVars.cardsGuessed += 1
		guessed = true
		if GlobalVars.numberSelected == cardNum:
			$CardAnimatedSprite.set_animation("Correct Cards")
			$CardAnimatedSprite.set_frame(cardNum)
			GlobalVars.cardsCorrect += 1 # Increments the amount of correct cards in order to display to the user
		else:
			$CardAnimatedSprite.set_animation("Incorrect Cards")
			$CardAnimatedSprite.set_frame(cardNum)

func _on_mouse_listener_mouse_entered():
	mouseOnCard = true

func _on_mouse_listener_mouse_exited():
	mouseOnCard = false
	
func startGame():
		# We're getting a random number between 0 and 9 on the cards avaliable, which will be used to change to the
	# frame of the card that is selected.
	cardNum = randi_range(0, 9)
	$CardAnimatedSprite.set_animation("Cards")
	$CardAnimatedSprite.set_frame(cardNum)
	
	# Timer before the cards flip over to hide what value they have.
	match GlobalVars.currentLevel:
		1:
			await get_tree().create_timer(2).timeout
		2:
			await get_tree().create_timer(2).timeout
		3:
			await get_tree().create_timer(2).timeout
		4:
			await get_tree().create_timer(1.5).timeout
		5:
			await get_tree().create_timer(1.5).timeout
	
	# This will happen after the timer goes off in the previous match statement.
	# The 10th frame is the back of the card to hide the number from the player.
	$CardAnimatedSprite.set_animation("Cards")
	$CardAnimatedSprite.set_frame(10)
	timerSetOff = true
