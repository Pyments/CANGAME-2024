extends Node

var prelib_lixos = preload("res://scenes/lib_lixos.tscn")
var lib_lixos
var x_positions = [96, 288, 480, 673, 864]
var ultima_posicao_ocupada = -1
var distancia_minima = 300

func _ready():
	randomize()
	lib_lixos = prelib_lixos.instantiate()
	
func _on_timer_timeout():
	if global.vel_y >= 200:
		get_node("Timer").set_wait_time(randf_range(0.1, 1))
		print(global.vel_y)
	else:
		get_node("Timer").set_wait_time(randf_range(0.1, 3))
		print(global.vel_y)
		
		
	var lixo = lib_lixos.geraLixoRandomico()
	
	var random_index = randi() % x_positions.size()

	while  ultima_posicao_ocupada != -1 and abs(x_positions[random_index] - x_positions[ultima_posicao_ocupada]) < distancia_minima:
		random_index = randi() % x_positions.size()
	
	ultima_posicao_ocupada = random_index
	lixo.position = Vector2(x_positions[random_index], -30)
	get_owner().add_child(lixo)
