extends Node

var prelib_lixos = preload("res://scenes/lib_lixos.tscn")
var lib_lixos
var x_positions = [96, 288, 480, 673, 864]
var ultima_posicao_ocupada = -1
var distancia_minima = 200

func _ready():
	randomize()
	lib_lixos = prelib_lixos.instantiate()
	
func _on_timer_timeout():
	get_node("Timer").set_wait_time(randf_range(0.3, 0.1))
	
	var lixo = lib_lixos.geraLixoRandomico()
	
	var random_index = randi() % x_positions.size()

	while  ultima_posicao_ocupada != -1 and abs(x_positions[random_index] - x_positions[ultima_posicao_ocupada]) < distancia_minima:
		random_index = randi() % x_positions.size()
	
	ultima_posicao_ocupada = random_index
	lixo.position = Vector2(x_positions[random_index], -30)
	get_owner().add_child(lixo)
