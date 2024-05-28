extends Node

var arrastando_objeto = null

var vel_y = 800

func set_arrastando(obj):
	arrastando_objeto = obj
	
func get_arrastando():
	return arrastando_objeto


var papel = "papel"
var metal = "metal"
var organico = "organico"
var plastico = "plastico"
var vidro = "vidro"
