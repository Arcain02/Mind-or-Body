extends Node2D

var readyToPlay : bool = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if GlobalVars.dialougeDone == true:
		GlobalVars.dialougeDone = false # so the animation doesn't restart over and over
		await get_tree().create_timer(1.5).timeout
		$AnimationPlayer.play("Fade Out")
		await get_tree().create_timer(1).timeout
		readyToPlay = true
	if readyToPlay == true and (Input.is_action_just_pressed("ui_accept") or Input.is_action_just_pressed("left_mouse_button")):
		get_tree().change_scene_to_file("res://Scenes/Card Game.tscn")
