extends Node2D


func _ready() -> void:
	var dict = Utils.fileToDictionary("res://config/ListReferences.json")
	var toAdd = dict["TILE_SET"]
	
	for i in toAdd:
		get_node("marker/OptionButton").add_item(i)


func getSelectToString():
	var x = get_node("marker/InputRTL4/InputRTL").bbcode_text
	var y = get_node("marker/InputRTL3/InputRTL2").bbcode_text
	var tileset = get_node("marker/OptionButton").selected
	tileset = get_node("marker/OptionButton").get_item_text(tileset)
	return tileset+"_"+x+"_"+y



func getInputToString(): return getSelectToString()
