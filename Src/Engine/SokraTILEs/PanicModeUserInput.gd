extends Node

var nodeOfPlayerLayer
var nodeOfCamOfPlayer 

var kitInst
var charInst
var  invInst
func _ready() -> void:
	kitInst = getInstanceOfSubscene("res://Src/scenes/Gameloop/PanicMode/Subscenes/Kits.tscn")
	charInst = getInstanceOfSubscene("res://Src/scenes/Gameloop/PanicMode/Subscenes/Status.tscn")
	invInst = getInstanceOfSubscene("res://Src/scenes/Gameloop/PanicMode/Subscenes/Inv.tscn")


func _input(event: InputEvent) -> void:
################################################################################
##  --- Map side ---                                                          ##
################################################################################

# --- Directional Input of Player ---
	if not event.is_echo() and event.is_pressed():
		if event.is_action_pressed("PlayerDirectionInput"):
			
			nodeOfPlayerLayer.interpreteDirection(event)
			nodeOfPlayerLayer.movePlayer()
			nodeOfCamOfPlayer.updateCenter(nodeOfPlayerLayer.playerPos)



################################################################################
##  --- Info side ---                                                         ##
################################################################################
# --- Type of Infopanel ---
	if not event.is_echo() and event.is_pressed():
		
		if event.is_action_pressed("Panic_Info_Kits"):
			replaceNode("kits")
			
		elif event.is_action_pressed("Panic_Info_Inv"):
			replaceNode("inv")
		
		elif event.is_action_pressed("Panic_Info_Char"):
			replaceNode("char")




func getInstanceOfSubscene(filepath):
	var loadedInfo = load(filepath)
	return loadedInfo.instance()

func recievePlayer(node):
	nodeOfPlayerLayer=node
func recievePlayerCam(node):
	nodeOfCamOfPlayer=node

var possibleNodes = ["root_Kits","root_Status","root_inv"]
func replaceNode(stringOfNode):
	
	for i in possibleNodes.size():
		if get_node("open Info panel").has_node(possibleNodes[i]):
			get_node("open Info panel").remove_child(.get_node("open Info panel").get_node(possibleNodes[i]))
	
	match stringOfNode:
		"inv":
			get_node("open Info panel").add_child(invInst)
		"kits":
			get_node("open Info panel").add_child(kitInst)
		"char":
			get_node("open Info panel").add_child(charInst)
	
	
	for i in get_node("open Info panel").get_child_count():
		print(get_node("open Info panel").get_child(i).name)



