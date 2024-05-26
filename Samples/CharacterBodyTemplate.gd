extends CharacterBody3D

const VELOCIDADE = 5.0
const VELOCIDADE_PULO = 4.5
const SENSIBILIDADE = 0.002

# Balanço da cabeça
const BAL_FREQ = 2.0
const BAL_QUANT = 0.08
var t_bal = 0.0

# Usa a gravidade das configurações do projeto 
var gravidade = ProjectSettings.get_setting("physics/3d/default_gravity")

@onready var cabeca = $Cabeça
@onready var camera = $Cabeça/Camera3D

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func _unhandled_input(event):
	if event is InputEventMouseMotion:
		cabeca.rotate_y(-event.relative.x * SENSIBILIDADE)
		camera.rotate_x(-event.relative.y * SENSIBILIDADE)
		camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-40), deg_to_rad(60))

func _physics_process(delta):
	# Adiciona gravidade.
	if not is_on_floor():
		velocity.y -= gravidade * delta

	# Pulo.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = VELOCIDADE_PULO

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = (cabeca.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * VELOCIDADE
		velocity.z = direction.z * VELOCIDADE
	else:
		velocity.x = 0.0
		velocity.z = 0.0 
	
	# Balanço da cabeça
	t_bal += delta * velocity.length() * float(is_on_floor())
	camera.transform.origin = _balancoCabeca(t_bal)
	
	move_and_slide()
	
func _balancoCabeca(time) -> Vector3:
	var pos = Vector3.ZERO
	pos.y = sin(time * BAL_FREQ) * BAL_QUANT
	return pos
