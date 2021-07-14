extends Node2D
class_name Condition_Effect


var effectShortName


func getSelectToString():
	var x = get_node("marker/InputRTL4/InputRTL").bbcode_text
	var y = get_node("marker/InputRTL3/InputRTL2").bbcode_text
	return [effectShortName,x,y]


func getInputToString(): return getSelectToString()
