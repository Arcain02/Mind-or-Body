extends Node2D

var inArea : bool = false

# The mouse cords will be relative to the global position rather than the position of the sprite.
# We positioned the sprite in this scene that it shouldn't even need to move from where it currently is
var mouseX : int

# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalVars.numberSelected = -1
	$AnimatedSprite2D.set_frame(0) # Sets the frame to the default of 0.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if GlobalVars.cardSelectorEnable == true:
		if inArea and Input.is_action_just_pressed("left_mouse_button"):
			mouseX = get_global_mouse_position().x
			selectedNum()

# In order to start checking for mouse input, we check if the mouse has entered the area before we try to register
# input from the user in this section.
func _on_selector_area_mouse_entered():
	inArea = true

func _on_selector_area_mouse_exited():
	inArea = false

func selectedNum():
	# We're not using less/greater than or equal to because that can sometimes register as 2 different numbers
	# if the user's mouse is positioned in a certain way. 
	if mouseX >= 40 and mouseX < 104: # Zero
		$AnimatedSprite2D.set_frame(1)
		GlobalVars.numberSelected = 0
		
	elif mouseX > 104 and mouseX < 168: # One
		$AnimatedSprite2D.set_frame(2)
		GlobalVars.numberSelected = 1
		
	elif mouseX > 168 and mouseX < 232: # Two
		$AnimatedSprite2D.set_frame(3)
		GlobalVars.numberSelected = 2
	
	elif mouseX > 232 and mouseX < 296: # Three
		$AnimatedSprite2D.set_frame(4)
		GlobalVars.numberSelected = 3
	
	elif mouseX > 296 and mouseX < 360: # Four
		$AnimatedSprite2D.set_frame(5)
		GlobalVars.numberSelected = 4
	
	elif mouseX > 360 and mouseX < 424: # Five
		$AnimatedSprite2D.set_frame(6)
		GlobalVars.numberSelected = 5
	
	elif mouseX > 424 and mouseX < 488: # Six
		$AnimatedSprite2D.set_frame(7)
		GlobalVars.numberSelected = 6
	
	elif mouseX > 488 and mouseX < 552: # Seven
		$AnimatedSprite2D.set_frame(8)
		GlobalVars.numberSelected = 7
	
	elif mouseX > 552 and mouseX < 616: # Eight
		$AnimatedSprite2D.set_frame(9)
		GlobalVars.numberSelected = 8
	
	elif mouseX > 616 and mouseX <= 680: # Nine
		$AnimatedSprite2D.set_frame(10)
		GlobalVars.numberSelected = 9
