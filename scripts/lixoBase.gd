extends Node2D

var arrastando = false
var arrastavel = false
var dentroCaminho = false
var lixoSobrepor
var refBody
var offset: Vector2
var posInicial: Vector2

var vel_y = global.vel_y

func _ready():
	set_process(true)

func _process(delta):
	if arrastavel:
		if Input.is_action_just_pressed("click"):
			posInicial = global_position
			offset = get_global_mouse_position() - global_position
			arrastando = true		
		if Input.is_action_pressed("click"):
			global_position = get_global_mouse_position() - offset
		elif Input.is_action_just_released("click"):
			arrastando = false
			var tween = get_tree().create_tween()
			if dentroCaminho:
				tween.tween_property(self,"global_position",refBody.global_position,0.2).set_ease(Tween.EASE_OUT)
			else:
				tween.tween_property(self,"global_position",posInicial,0.2).set_ease(Tween.EASE_OUT)
	position += Vector2(0, 1) * vel_y * delta
	
func _on_area_2d_mouse_entered():
	if not arrastando:
		arrastavel = true
		scale = Vector2(1.05, 1.05)
		
func _on_area_2d_mouse_exited():
		if not arrastando:
			arrastavel = false
			scale = Vector2(1, 1)

func _on_area_2d_body_entered(body):
	if body.is_in_group("dropable"):
		dentroCaminho = true
		refBody = body
	if body.is_in_group("lixo"):
		lixoSobrepor = body
		

func _on_area_2d_body_exited(body):
	if body.is_in_group("dropable"):
		dentroCaminho = false
