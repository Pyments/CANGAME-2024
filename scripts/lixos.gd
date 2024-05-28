extends Node2D

var vel_y = global.vel_y


func _ready():
	set_process(true)
	pass

func _process(delta):
	position += Vector2(0, 1) * vel_y * delta
	pass
