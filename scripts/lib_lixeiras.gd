extends Node

var prelib_lixos = preload("res://scenes/lib_lixos.tscn")
var lib_lixos


func _ready():
	lib_lixos = prelib_lixos.instantiate()
	pass

func _on_lixeirametal_area_entered(area):
	var lixo = lib_lixos.returnMetal()
	if lixo == global.metal:
		print("Metal entrou")
	else:
		get_tree().quit()


func _on_lixeiraorganico_area_entered(area):
	var lixo = lib_lixos.returnOrganico()
	if lixo == global.organico:
		print("Organico entrou")
	else:
		get_tree().quit()


func _on_lixeirapapel_area_entered(area):
	var lixo = lib_lixos.returnPapel()
	if lixo == global.papel:
		print(lixo)
		print("Papel entrou")
	else:
		get_tree().quit()


func _on_lixeiraplastico_area_entered(area):
	var lixo = lib_lixos.returnPlastico()
	if lixo == global.plastico:
		print("Plastico entrou")
	else:
		get_tree().quit()


func _on_lixeiravidro_area_entered(area):
	var lixo = lib_lixos.returnVidro()
	if lixo == global.vidro:
		print("Vidro entrou")
	else:
		get_tree().quit()
