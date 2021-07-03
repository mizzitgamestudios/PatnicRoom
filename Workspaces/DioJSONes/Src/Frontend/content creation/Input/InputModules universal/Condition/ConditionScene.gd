extends Node2D
<<<<<<< HEAD
class_name Condition_Effect


var effectShortName
=======


func _ready() -> void:
	var dict = Utils.fileToDictionary("res://config/ListReferences.json")
	var toAdd = dict["CONDITION"]
	
	for i in toAdd:
		get_node("marker/OptionButton").add_item(i)
>>>>>>> 14ed4bc523602584d0fecdfce3fc61f9ee8a2684


func getSelectToString():
	var x = get_node("marker/InputRTL4/InputRTL").bbcode_text
	var y = get_node("marker/InputRTL3/InputRTL2").bbcode_text
<<<<<<< HEAD
	return [effectShortName,x,y]


func getInputToString(): return getSelectToString()
=======
	var tileset = get_node("marker/OptionButton").selected
	tileset = get_node("marker/OptionButton").get_item_text(tileset)
	return tileset.to_upper()+"_"+x+"_"+y
>>>>>>> 14ed4bc523602584d0fecdfce3fc61f9ee8a2684
