extends Node2D


func _ready():
	#var essentialpreload = preload("res://Src/Scene/Add/essential/essential.tscn")
	var essentialInstance = essentialpreload.instance()
	get_node(".").add_child(essentialInstance)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
