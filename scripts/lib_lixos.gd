extends Node

func geraLixo(valor):
	return get_children()[valor].duplicate()

func geraLixoRandomico():
	return get_children()[randi() % get_children().size()].duplicate()
