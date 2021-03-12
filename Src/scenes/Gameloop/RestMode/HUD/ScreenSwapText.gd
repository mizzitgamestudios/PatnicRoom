extends RichTextLabel

var writtenOut
func _ready():
	
	bbcode_enabled = true
	writtenOut=bbcode_text
	bbcode_text = "[color=white]"+writtenOut+"[/color]"	



func _input(event):
	checkForInput(event)

func checkForInput(event):
	if event is InputEventKey and event.is_pressed():
		RestMode.userinput.keyInputCompute(event,get_node("."))
	
	if event is InputEventMouse and Util.Nodes.isMouseOnNode(get_node(".")):
		RestMode.userinput.mouseInputCompute(event,get_node("."))
	else:
		bbcode_text = "[color=white]"+writtenOut+"[/color]"
