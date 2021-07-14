extends Node
class_name Parent_Form	

func _ready() -> void:
	var formFiller = FormFiller.new(self)




func backToMainMenue() -> void:
	get_tree().change_scene("res://Src/Main.tscn")

