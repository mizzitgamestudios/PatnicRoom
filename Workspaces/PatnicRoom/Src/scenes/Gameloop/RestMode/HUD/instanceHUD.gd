extends Node

func _ready():
	Gameloop.scene = self
	get_node("background").texture = Util.RNG.getRngBackground()
	
