extends OptionButton


func _ready():
	for i in Conventions.types["known types"].size():
		get_popup().add_item(Conventions.types["known types"][i])

func _toggled(button_pressed):
	if get_selected_id() != 0:
		print(get_item_text(get_selected_id()))
		Controller.appendFormByTypeRequirements(get_item_text(get_selected_id()),get_node("../../Basic Zone"))

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
