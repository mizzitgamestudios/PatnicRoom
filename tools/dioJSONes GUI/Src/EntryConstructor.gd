extends Node


var sizeHeight=48


func create(V2Origin,key,tooltip,instance,scenenode):
	instance.get_node("entry").set_position(V2Origin)
	instance.get_node("entry/key/text").bbcode_text = "[color=black]"+key
	instance.get_node("entry/key").hint_tooltip = tooltip
	scenenode.add_child(instance)
