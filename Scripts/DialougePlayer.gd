extends CanvasLayer

@export_file("*.json") var d_file

var dialouge = []

var current_dialogue_id : int

# Called when the node enters the scene tree for the first time.
func _ready():
	dialouge = load_dialogue()
	
	$NinePatchRect/Name.text = dialouge[0]['name']
	$NinePatchRect/Content.text = dialouge[0]['text']
	current_dialogue_id = -1
	next_script()
	

func load_dialogue():
	var file = FileAccess.open("res://Textures/Dialouge/json/OpeningText.json", FileAccess.READ)
	var content = JSON.parse_string(file.get_as_text())
	return content
	
func _input(event):
	if event.is_action_pressed("ui_accept") or event.is_action_pressed("left_mouse_button"):
		next_script()

func next_script():
	current_dialogue_id += 1
	
	if current_dialogue_id < len(dialouge):
		$NinePatchRect/Name.text = dialouge[current_dialogue_id]['name']
		$NinePatchRect/Content.text = dialouge[current_dialogue_id]['text']
		if current_dialogue_id == len(dialouge) - 1:
			$Thingy.play("End")
			GlobalVars.dialougeDone = true
