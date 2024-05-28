extends Button

func _on_mouse_entered():
	$Sair.modulate.r = 0.7
	$Sair.modulate.g = 0.7
	$Sair.modulate.b = 0.7
	pass 

func _on_mouse_exited():
	$Sair.modulate.r = 1
	$Sair.modulate.g = 1
	$Sair.modulate.b = 1
	pass 

func _on_pressed():
	$Sair.modulate.r = 0.5
	$Sair.modulate.g = 0.5
	$Sair.modulate.b = 0.5
	get_tree().quit()
	pass
