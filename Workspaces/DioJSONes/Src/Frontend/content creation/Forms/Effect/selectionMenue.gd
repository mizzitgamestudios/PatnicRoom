extends Control


onready var effectButton = get_node("..").get_node("Effect/CheckButton")
onready var isStatmod = effectButton.isStatmod
var nodeBase = "ScrollContainer/VBoxContainer/"
func _ready() -> void:
	pass # Replace with function body.




func fillContainer(state) -> void:
	var listToShow
	if state:  listToShow = SYNTAX.GET_STAT_MOD_TO_STRING()
	if !state: listToShow = SYNTAX.GET_CONDITION_TO_STRING()
	fillByList(listToShow)



func fillByList(list:Array):

	var allNodes = get_node(nodeBase).get_children()
	for node in allNodes:
		var next
		
		node.get_node("Left/RichTextLabel").bbcode_text = ""
		node.get_node("Right/RichTextLabel").bbcode_text = ""
		
		node.get_node("Left/RichTextLabel").bbcode_enabled = true
		node.get_node("Right/RichTextLabel").bbcode_enabled = true
		
		next = list.pop_front()
		if next is String: 
			node.get_node("Left/RichTextLabel").bbcode_text = "[center]"+next
		
		next = list.pop_front()
		if next is String: 
			node.get_node("Right/RichTextLabel").bbcode_text = "[center]"+next





