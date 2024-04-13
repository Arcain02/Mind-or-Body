extends Node2D

var showStuff : bool = false 
var alreadyShown : bool = false
var mainMenuMove : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	if GlobalVars.keepBody > GlobalVars.newBody:
		$ChoiceRevealed.set_text("You've chosen to keep your body.")
	elif GlobalVars.newBody > GlobalVars.keepBody:
		$ChoiceRevealed.set_text("You've chosen to obtain a new body.")
	else:
		$ChoiceRevealed.set_text("Your choice is neither.")
	
	$AnimationPlayer.play("Text Fade In")
	await get_tree().create_timer(4.5).timeout
	

func _process(_delta):
	if Input.is_action_just_pressed("left_mouse_button") or Input.is_action_just_pressed("ui_accept"):
		showStuff = true
		if mainMenuMove == true:
			get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")
		
	if showStuff == true and alreadyShown == false:
		displayFlavor()
		alreadyShown = true

func displayFlavor():
	if GlobalVars.keepBody > GlobalVars.newBody:
		$FlavorText.set_text("You've decided to keep your body. You decide to reminisce on your past and pass after 3 days.")
	elif GlobalVars.newBody > GlobalVars.keepBody:
		$FlavorText.set_text("You've obtained your new body and it works wonderfully. There is however a constant feeling of emptiness within you.")
	$AnimationPlayer.play("Flavor Fade In")
	
	await get_tree().create_timer(2.5).timeout
	mainMenuMove = true
