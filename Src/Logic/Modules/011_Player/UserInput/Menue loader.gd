extends Node
class_name _menueLoader

var parentUserInput
func _init(parentUserInputPara):
	parentUserInput = parentUserInputPara

	kitInst = getInstanceOfSubscene("res://Src/scenes/Gameloop/PanicMode/Subscenes/Kits.tscn")
	charInst = getInstanceOfSubscene("res://Src/scenes/Gameloop/PanicMode/Subscenes/Monitor.tscn")
	invInst = getInstanceOfSubscene("res://Src/scenes/Gameloop/PanicMode/Subscenes/Inv.tscn")  
	newsInst = getInstanceOfSubscene("res://Src/scenes/Gameloop/PanicMode/Subscenes/News.tscn")



var kitInst
var charInst
var  invInst  
var newsInst

func getInstanceOfSubscene(filepath):
	var loadedInfo = load(filepath)
	return loadedInfo.instance()



var possibleNodes = ["root_Kits","root_Status","root_inv","root_News"]
func replaceNode(stringOfNode):
	
	rmeovePreviousNode()
	
	match stringOfNode:
		"inv":
			parentUserInput.get_node("open Info panel").add_child(invInst)
		"kits":
			parentUserInput.get_node("open Info panel").add_child(kitInst)
		"char":
			parentUserInput.get_node("open Info panel").add_child(charInst)
		"news":
			parentUserInput.get_node("open Info panel").add_child(newsInst)



func rmeovePreviousNode():
	for i in possibleNodes.size():
		if parentUserInput.get_node("open Info panel").has_node(possibleNodes[i]):
			parentUserInput.get_node("open Info panel").remove_child(parentUserInput.get_node("open Info panel").get_node(possibleNodes[i]))
