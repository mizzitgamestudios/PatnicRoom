extends Panel

var value
func _input(event: InputEvent) -> void:
	
	value = get_node("slider").value
	get_node("counter").bbcode_text = str(value)


func getSelectToString():
	return get_node("counter").bbcode_text
<<<<<<< HEAD


func getInputToString(): return get_node("counter").bbcode_text
=======
>>>>>>> 14ed4bc523602584d0fecdfce3fc61f9ee8a2684
