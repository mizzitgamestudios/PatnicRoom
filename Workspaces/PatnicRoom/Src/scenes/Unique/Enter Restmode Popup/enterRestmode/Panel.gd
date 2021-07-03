extends Node2D


var value

func _init(valuePara):
	self.connect("tree_entered",self,"showMouse")



func showMouse():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
