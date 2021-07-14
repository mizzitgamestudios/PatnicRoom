extends RichTextLabel

var color: String
var first = true
var baseString : String

func _ready():   
	color      = "white"
	

var firstTime = true
func _input(event: InputEvent):
	if firstTime:   baseString = bbcode_text; firstTime = false
	bbcode_text = ""
	

	if !isMouseOnNode(self):	
		bbcode_text = "[color=white]"+baseString


	if isMouseOnNode(self):
		bbcode_text = "[color=yellow]"+baseString


	if isMouseOnNode(self) and event.is_action_pressed("Interface_Mouse_Left"): 
		#get_parent().get_parent().instanciateTable(self)
		get_parent().get_parent().get_parent().setCurrentCategory(self)





func setColorInText(color: String):   bbcode_text = "[color="+color+"]"+ baseString +"[/color]"

func isMouseOnNode(node):
	var minVec = node.rect_global_position
	var cacheSizeOfRect = Vector2(node.get_end().x-node.get_begin().x,node.get_end().y-node.get_begin().y)
	var maxVec = Vector2(minVec.x+cacheSizeOfRect.x,minVec.y+cacheSizeOfRect.y)
		
	var mouse = node.get_global_mouse_position()

	return mouse.x > minVec.x and mouse.y > minVec.y and mouse.x < maxVec.x and mouse.y < maxVec.y
