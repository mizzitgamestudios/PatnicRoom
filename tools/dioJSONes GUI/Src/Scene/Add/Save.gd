extends Panel



var minVec
var maxVec
func _ready():
	minVec = rect_global_position
	var cacheSizeOfRect = Vector2(get_end().x-get_begin().x,get_end().y-get_begin().y)
	maxVec = Vector2(minVec.x+cacheSizeOfRect.x,minVec.y+cacheSizeOfRect.y)



func _input(event):
	if isMouseOnNode(minVec,maxVec,get_node(".")):
		get_node(".").set("custom_styles/panel",StyleConstructor.createButtonStyleAwake())
		if event.is_action("ui_accept"):
			Controller.checkForm(get_node("RichTextLabel3"))
	else:
		get_node(".").set("custom_styles/panel",StyleConstructor.createButtonStyleSleep())

		


func isMouseOnNode(minVec,maxVec,node):
	var mouse = node.get_global_mouse_position()
	return mouse.x > node.minVec.x and mouse.y > node.minVec.y and mouse.x < node.maxVec.x and mouse.y < node.maxVec.y


	
	
	
	
	
	
