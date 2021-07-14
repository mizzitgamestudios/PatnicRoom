extends RichTextLabel




var rootParent

var rawText= ""
func _input(event: InputEvent) -> void:
	
	var currentText = bbcode_text
	
	if Util.Nodes.isMouseOnNode(self):
		rawText = bbcode_text
		rawText = rawText.replace("[color=yellow]", "")
		rawText = rawText.replace("[/color]", "")
		
		currentText = "[color=yellow]"+currentText+"[/color]"
		bbcode_text = currentText
	
	elif !currentText.find("[/color]"):
			bbcode_text = rawText
	
	if Util.Nodes.isMouseOnNode(self) and event.is_action("Interface_Mouse_Left"):
		rootParent.setInputField(rawText)
