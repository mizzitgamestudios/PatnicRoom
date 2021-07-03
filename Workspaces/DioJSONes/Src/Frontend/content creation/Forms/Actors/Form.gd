extends Parent_Form

















func _on_checkAndSave_pressed() -> void:
	var dict = Parser.buildGameElement()
	Utils.printJSON(dict)

