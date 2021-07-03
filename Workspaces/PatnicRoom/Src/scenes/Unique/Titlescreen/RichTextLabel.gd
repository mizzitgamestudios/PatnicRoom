extends RichTextLabel

var filepath
func initialice(filepathPara): 
	filepath = filepathPara ;
	inputConvention = bbcode_text

var scene
var cache
var inputConvention

func _input(event: InputEvent) -> void:
	
	if isMouseOnNode(self) :
		bbcode_text = "[color=yellow]"+inputConvention
	
	if !isMouseOnNode(self) :
		bbcode_text = "[color=white]"+inputConvention
	
	if event.is_action("Interface_Mouse_Left") and isMouseOnNode(self):
		if is_instance_valid(scene): get_parent().get_node("controller-pin").remove_child(scene)
		
		scene = load(filepath).instance()
		get_parent().get_node("controller-pin").add_child(scene)
		
	
	
	



func isMouseOnNode(node):
	var minVec = node.rect_global_position
	var cacheSizeOfRect = Vector2(node.get_end().x-node.get_begin().x,node.get_end().y-node.get_begin().y)
	var maxVec = Vector2(minVec.x+cacheSizeOfRect.x,minVec.y+cacheSizeOfRect.y)
		
	var mouse = node.get_global_mouse_position()

	return mouse.x > minVec.x and mouse.y > minVec.y and mouse.x < maxVec.x and mouse.y < maxVec.y
