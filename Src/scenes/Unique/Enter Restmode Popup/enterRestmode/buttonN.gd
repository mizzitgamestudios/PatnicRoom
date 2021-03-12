extends Control


func _input(event):
	if event.is_action("leftClickMouse"):
		get_parent().get_parent().remove_child(get_node(".."))


