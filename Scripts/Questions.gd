extends Node2D

func _ready():
	# Depending on the level, we switch 
	match GlobalVars.currentLevel:
		1:
			$Question.set_text("If I were to replace every part of my body would I really be me?")
			$LabelAnswerA.set_text("Probably yeah") # New Body
			$LabelAnswerB.set_text("Not really.") # Keep Body
			$LabelAnswerC.set_text("This requires too much thought.") # Neutral
		2:
			$Question.set_text("Would my friends care more about me dying or care more about me forgetting them? Do I even care?")
			$LabelAnswerA.set_text("They wouldn't think I'm me without my memories.") # Keep Body
			$LabelAnswerB.set_text("They'd try and make more memories with me if I got a new body.") # New Body
			$LabelAnswerC.set_text("I don't care what they think.") # New Body
		3:
			$Question.set_text("I remember they had me take care of a cat when I was first created. If I forget that cat does our time together disappear as well?")
			$LabelAnswerA.set_text("Yes. Without those memories what proof is there of all of the little things we did?") # Keep Body
			$LabelAnswerB.set_text("No. Those moments still happened even if I forget them.") # New Body
			$LabelAnswerC.set_text("") # There's no C answer for this question.
			$LabelAnswerC/AnswerC.disabled = true
		4:
			$Question.set_text("I've learnt so much from my experiences. Is it really worth it starting from square one?")
			$LabelAnswerA.set_text("Yes. I'll always be able to learn from new experiences. They weren't that unique.") # New Body
			$LabelAnswerB.set_text("No. My experiences were unique. I wouldn't learn the same things from experiences.") # Keep Body
			$LabelAnswerC.set_text("") # There's no C answer for this question.
			$LabelAnswerC/AnswerC.disabled = true
		5:
			$Question.set_text("How was my personality shaped?")
			$LabelAnswerA.set_text("It was programmed into me by my creators.")
			$LabelAnswerB.set_text("My experiences and memories shaped my personality. What I started with is only part of it.")
			$LabelAnswerC.set_text("") # There's no C answer for this question.
			$LabelAnswerC/AnswerC.disabled = true

func _on_answer_a_pressed():
	match GlobalVars.currentLevel:
		1:
			GlobalVars.newBody += 2
		2:
			GlobalVars.keepBody += 2
		3:
			GlobalVars.keepBody += 2
		4:
			GlobalVars.newBody += 1
		5:
			GlobalVars.newBody += 2

	# Increments the level once the user's option has been registered, so that when they enter this scene again
	# they are shown the different options.
	GlobalVars.currentLevel += 1
	
	changeScene()

func _on_answer_b_pressed():
	
	match GlobalVars.currentLevel:
		1:
			GlobalVars.keepBody += 2
		2:
			GlobalVars.newBody += 1
		3:
			GlobalVars.newBody += 2
		4:
			GlobalVars.keepBody += 1
		5:
			GlobalVars.keepBody += 2

	# Increments the level once the user's option has been registered, so that when they enter this scene again
	# they are shown the different options.
	GlobalVars.currentLevel += 1
	
	changeScene()

func _on_answer_c_pressed():
	
	match GlobalVars.currentLevel:
		1:
			pass # Neutral answer this level
		2:
			GlobalVars.newBody += 1
		3:
			pass # No C option in this level
		4:
			pass # No C option in this level
		5:
			pass # No C option in this level
	
	# Increments the level once the user's option has been registered, so that when they enter this scene again
	# they are shown the different options.
	GlobalVars.currentLevel += 1
	
	changeScene()

func changeScene():
	$LabelAnswerA/AnswerA.disabled = true
	$LabelAnswerB/AnswerB.disabled = true
	$LabelAnswerC/AnswerC.disabled = true
	
	$AnimationPlayer.play("Fade Out")
	await get_tree().create_timer(1.5).timeout
	if GlobalVars.currentLevel <= 5:
		get_tree().change_scene_to_file("res://Scenes/Card Game.tscn")
	elif GlobalVars.currentLevel > 5:
		get_tree().change_scene_to_file("res://Scenes/Choice.tscn")
