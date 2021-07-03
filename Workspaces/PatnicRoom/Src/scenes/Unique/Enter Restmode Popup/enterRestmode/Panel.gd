extends Node2D


var value

func _init(valuePara):
	print("uhriuhbfbi")
	self.connect("tree_entered",self,"showMouse")
	




func showMouse():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func _on_Button_pressed() -> void:
	print("uhriuhbfbi")
	get_tree().change_scene("res://Src/scenes/Gameloop/RestMode/Progression.tscn")
