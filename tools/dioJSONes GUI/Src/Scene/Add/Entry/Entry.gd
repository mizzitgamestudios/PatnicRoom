extends Node2D

func create(V2Origin,key,tooltip):
	get_node("entry").set_position(V2Origin)
	get_node("entry/key/text").bbcode_text = "[color=black]"+key
