extends Node

func _ready():
	pass

func _on_lixeirametal_area_entered(area):
	print("Metal")


func _on_lixeiraorganico_area_entered(area):
	print("Organico")


func _on_lixeirapapel_area_entered(area):
	print("papel")


func _on_lixeiraplastico_area_entered(area):
	print("plastico")


func _on_lixeiravidro_area_entered(area):
	print("vidro")
