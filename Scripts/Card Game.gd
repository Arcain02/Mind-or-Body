extends Node2D

var cardsSelected : int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalVars.cardsCorrect = 0
	GlobalVars.cardsGuessed = 0
	
	# The game hasn't started yet unless the player clicks the start button.
	GlobalVars.cardGameStarted = false
	
	match GlobalVars.currentLevel:
		1:
			$LevelLabel.set_text("Level 1/5")
		2:
			$LevelLabel.set_text("Level 2/5")
			$CardFour.set_visible(true)
		3:
			$LevelLabel.set_text("Level 3/5")
			$CardFour.set_visible(true)
			$CardFive.set_visible(true)
		4:
			$LevelLabel.set_text("Level 4/5")
			$CardFour.set_visible(true)
			$CardFive.set_visible(true)
		5:
			$LevelLabel.set_text("Level 5/5")
			$CardFour.set_visible(true)
			$CardFive.set_visible(true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	match GlobalVars.currentLevel:
		1:
			levelOneCards()
			if GlobalVars.cardsGuessed == 3:
				moveScene()
		2:
			levelTwoCards()
			if GlobalVars.cardsGuessed == 4:
				moveScene()
		3:
			levelThreeCards()
			if GlobalVars.cardsGuessed == 5:
				moveScene()
		4:
			levelThreeCards()
			if GlobalVars.cardsGuessed == 5:
				moveScene()
		5:
			levelThreeCards()
			if GlobalVars.cardsGuessed == 5:
				moveScene()

func _on_start_button_pressed():
	$Grey.set_visible(false)
	$StartButton.set_visible(false)
	$ButtonLabel.set_visible(false)
	$Directions.set_visible(false)
	GlobalVars.cardGameStarted = true
	GlobalVars.cardSelectorEnable = true
	
func levelOneCards():
	match GlobalVars.cardsCorrect:
		0:
			$CardCorrectLabel.set_text("Cards Correct: 0/3")
		1:
			$CardCorrectLabel.set_text("Cards Correct: 1/3")
		2:
			$CardCorrectLabel.set_text("Cards Correct: 2/3")
		3:
			$CardCorrectLabel.set_text("Cards Correct: 3/3")

func levelTwoCards():
	match GlobalVars.cardsCorrect:
		0:
			$CardCorrectLabel.set_text("Cards Correct: 0/4")
		1:
			$CardCorrectLabel.set_text("Cards Correct: 1/4")
		2:
			$CardCorrectLabel.set_text("Cards Correct: 2/4")
		3:
			$CardCorrectLabel.set_text("Cards Correct: 3/4")
		4:
			$CardCorrectLabel.set_text("Cards Correct: 3/4")

# The card number only goes up to 5, so this will also be used for levels 4 and 5
func levelThreeCards():
	match GlobalVars.cardsCorrect:
		0:
			$CardCorrectLabel.set_text("Cards Correct: 0/5")
		1:
			$CardCorrectLabel.set_text("Cards Correct: 1/5")
		2:
			$CardCorrectLabel.set_text("Cards Correct: 2/5")
		3:
			$CardCorrectLabel.set_text("Cards Correct: 3/5")
		4:
			$CardCorrectLabel.set_text("Cards Correct: 4/5")
		5:
			$CardCorrectLabel.set_text("Cards Correct: 5/5")


func moveScene():
	$AnimationPlayer.play("Fade Out")
	await get_tree().create_timer(1.5).timeout
	get_tree().change_scene_to_file("res://Scenes/Questions.tscn")
