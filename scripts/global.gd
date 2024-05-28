extends Node

var arrastando_objeto = null

var vel_y = 100

func set_arrastando(obj):
	arrastando_objeto = obj
	
func get_arrastando():
	return arrastando_objeto
