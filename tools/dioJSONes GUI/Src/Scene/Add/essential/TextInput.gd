extends Panel


var minVec
var maxVec
func _ready():
	get_node(".").set("custom_styles/panel",StyleConstructor.createInputStyleSleep())
	minVec = rect_global_position
	var cacheSizeOfRect = Vector2(get_end().x-get_begin().x,get_end().y-get_begin().y)
	maxVec = Vector2(minVec.x+cacheSizeOfRect.x,minVec.y+cacheSizeOfRect.y)

var writtingmode=false
func _input(event):

	
	
	if isMouseOnNode(minVec,maxVec,get_node(".")):
		get_node(".").set("custom_styles/panel",StyleConstructor.createInputStyleAwake())
		if event.is_action("ui_accept"):
			
			writtingmode=true
		if writtingmode:
			get_node(".").set("custom_styles/panel",StyleConstructor.createInputStyleListening())
			interpreteInput(event)
	else:
		get_node(".").set("custom_styles/panel",StyleConstructor.createInputStyleSleep())
		writtingmode=false
		


func isMouseOnNode(minVec,maxVec,node):
	inputtext = get_node("text")
	var mouse = node.get_global_mouse_position()
	return mouse.x > node.minVec.x and mouse.y > node.minVec.y and mouse.x < node.maxVec.x and mouse.y < node.maxVec.y


var inputtext 
func interpreteInput(event):
	if event is InputEventKey and not event.echo and event.is_pressed() :
		inputtext.bbcode_text+=event.as_text()
	
	
	
	
	
	
	
	
	
	
	
