extends Panel

var value
func _input(event: InputEvent) -> void:
	
	value = get_node("slider").value
	get_node("counter").bbcode_text = str(value)


func getSelectToString():
	return get_node("counter").bbcode_text


func getInputToString(): return get_node("counter").bbcode_text
