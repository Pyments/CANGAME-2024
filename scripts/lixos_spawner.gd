extends Node

var prelib_lixos = preload("res://scenes/lib_lixos.tscn")
var lib_lixos
var x_positions = [96, 288, 480, 673, 864]

func _ready():
	randomize()
	lib_lixos = prelib_lixos.instantiate()

func _on_timer_timeout():
	get_node("Timer").set_wait_time(randf_range(0.3, 0.1))
	var lixo = lib_lixos.geraLixoRandomico()
	
	var random_index = randi() % x_positions.size()
	var random_x = x_positions[random_index]
	
	lixo.position = (Vector2(random_x, -40))
	get_owner().add_child(lixo)
