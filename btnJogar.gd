extends Button


func _on_mouse_entered():
	$Jogar.modulate.r = 0.7
	$Jogar.modulate.g = 0.7
	$Jogar.modulate.b = 0.7
	pass 

func _on_mouse_exited():
	$Jogar.modulate.r = 1
	$Jogar.modulate.g = 1
	$Jogar.modulate.b = 1
	pass # Replace with function body.

func _on_pressed():
	$Jogar.modulate.r = 0.5
	$Jogar.modulate.g = 0.5
	$Jogar.modulate.b = 0.5
	get_tree().change_scene_to_file("res://scenes/Main.tscn")
	pass # Replace with function body.
