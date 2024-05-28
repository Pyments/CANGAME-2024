extends Node2D

var arrastavel = false
var dentroCaminho = false
var refBody: StaticBody2D
var offset: Vector2
var posInicial: Vector2

func _ready():
	if arrastavel:
		if Input.is_action_just_pressed("click"):
			print("click")
			posInicial = global_position
			offset = get_global_mouse_position() - global_position
			global.arrastando = true		
		if Input.is_action_pressed("click"):
			global_position = get_global_mouse_position() - offset
		elif Input.is_action_just_released("click"):
			global.arrastando = false
			var tween = get_tree().create_tween()
			if dentroCaminho:
				tween.tween_property(self,"position",refBody.position,0.2).set_ease(Tween.EASE_OUT)
			else:
				tween.tween_property(self,"global_position",posInicial,0.2).set_ease(Tween.EASE_OUT)

func _on_area_2d_mouse_entered():
	if not global.arrastando:
		arrastavel = true
		scale = Vector2(1.05, 1.05)
		
func _on_area_2d_mouse_exited():
		if not global.arrastando:
			arrastavel = false
			scale = Vector2(1, 1)

func _on_area_2d_body_entered(body: StaticBody2D):
	if body.is_in_group("dropable"):
		dentroCaminho = true
		refBody = body

func _on_area_2d_body_exited(body):
	if body.is_in_group("dropable"):
		dentroCaminho = false
