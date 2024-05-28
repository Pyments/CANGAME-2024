extends Node

var lixos = []

func _ready():
	lixos.append("objeto")
	
func get_lixos():
	print(lixos)
	return lixos

func geraLixo(valor):
	return get_children()[valor].duplicate()

func geraLixoRandomico():
	return get_children()[randi() % get_children().size()].duplicate()
	
