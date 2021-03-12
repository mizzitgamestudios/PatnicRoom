extends RichTextLabel

var color: String
var first = true
func _ready():
	color="white"


func _input(event: InputEvent):
	
	
	
	if event is InputEventMouse: markSelectedInput(get_node("."),"yellow")
	
	if Util.Nodes.isMouseOnNode(get_node(".")):
		if Input.is_action_pressed("leftClickMouse"):
			RestMode.kitSelection.fillAllModulesForKits(get_node("."))

func setColorInText(color: String):
	bbcode_text = "[color="+color+"]"+ bbcode_text +"[/color]"

func markSelectedInput(node,colorBBCode):
	var cache=RestMode.kitSelection.saniticeCurrentKit(node.bbcode_text)
	if Util.Nodes.isMouseOnNode(node):
		node.bbcode_text = "[color="+colorBBCode+"]"+cache+"[/color]"
	else: 
		node.bbcode_text = "[color=white]"+cache+"[/color]"
