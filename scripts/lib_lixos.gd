extends Node
@onready var papel = $papel
@onready var metal = $metal
@onready var organico = $organico
@onready var plastico = $plastico
@onready var vidro = $vidro


func _ready():
	global.papel = papel
	global.metal = metal
	global.organico = organico
	global. plastico = plastico
	global.vidro = vidro
	

func geraLixo(valor):
	return get_children()[valor].duplicate()

func geraLixoRandomico():
	return get_children()[randi() % get_children().size()].duplicate()
	
func returnPapel():
	return global.papel
	
func returnMetal():
	return global.metal

func returnOrganico():
	return global.organico

func returnPlastico():
	return global.plastico

func returnVidro():
	return global.vidro
