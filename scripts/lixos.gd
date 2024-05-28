extends Node2D

var vel_y = 200

func _ready():
	set_process(true)
	pass

func _process(delta):
	position += Vector2(0, 1) * vel_y * delta
	pass
