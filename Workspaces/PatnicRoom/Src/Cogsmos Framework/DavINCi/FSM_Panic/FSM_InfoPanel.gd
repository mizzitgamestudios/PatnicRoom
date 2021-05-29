extends Object
class_name _DavINCi_FSM_InfoPanel


var isRoot       : bool
var isSame       : bool
var isCLIActive  : bool = true

var infoPanelInstance
var newInfopanelInstance

var infoPanelToLoad = {
	ENUM.INPUTS.INFO.KITS    : "res://Src/scenes/Gameloop/PanicMode/Subscenes/Kits Side Panel/Kits.tscn",
	ENUM.INPUTS.INFO.JURNAL  : "res://Src/scenes/Gameloop/PanicMode/Subscenes/Inv Side Panel/Inv.tscn",
	ENUM.INPUTS.INFO.MONITOR : "res://Src/scenes/Gameloop/PanicMode/Subscenes/Monitor Side Panel/Monitor.tscn",
	ENUM.INPUTS.INFO.NEWS    : "res://Src/scenes/Gameloop/PanicMode/Subscenes/News Side Panel/News.tscn",
}
 
func _init() -> void:   Signals.connect("animation_finished",self,"freeInfoPnale")



# ----- INPUT HANDLER -------------------------------------------------------- ##


func takeActionByEnum(inputEnum):
	if istInterfaceStateValid(inputEnum):
		
		if inputEnum == ENUM.INPUTS.INFO.CLI:
			manageCLI()
			
		else:
			newInfopanelInstance = load(infoPanelToLoad[inputEnum]).instance()
			
			if is_instance_valid(infoPanelInstance): playExitAnimation()
			else:                                    playEnterAnimation()
			

var cliNode
func manageCLI():
	isCLIActive = !isCLIActive
	
	if !isCLIActive:
		cliNode = load("res://Src/scenes/Unique/API_017_CLI/CLI.tscn").instance()
		DavINCi.gameloopScene.add_child(cliNode)
	
	else: DavINCi.gameloopScene.remove_child(cliNode)


func istInterfaceStateValid(inputEnum):
	var interfaceState = DavINCi.interfaceState
	var isValid = true
	
	
	if needsCLIConfirmationi(inputEnum):   
		API_017_CLI.processCmd("")
		isValid = false
	
	
#	if isNotCLI(inputEnum):                
#		API_017_CLI.processCmd("");   
#		isValid = false
	
	
	if isSameInfoPanel(inputEnum):                                      
		isValid = false
	
	
	return isValid



# ----- ANIMATOR --------------------------------------------------------------- ##


func playEnterAnimation():
	DavINCi.gameloopScene.get_node("SidePanel").add_child(newInfopanelInstance)
	DavINCi.gameloopScene.get_node("SidePanel").get_child(0).buildRef(self)
	infoPanelInstance = newInfopanelInstance
	



func playExitAnimation():
	DavINCi.gameloopScene.get_node("SidePanel").get_child(0).exitAnimation(self)



# ----- VALIDATOR ------------------------------------------------------------ ##


func needsCLIConfirmationi(inputEnum) -> bool : return isCLIActive and inputEnum == ENUM.INPUTS.INTERFACE.ENTER

func isNotCLI(inputEnum)              -> bool : return inputEnum != ENUM.INPUTS.INFO.CLI
func isCLI(inputEnum)                 -> bool : return !isNotCLI(inputEnum)

func isSameInfoPanel(inputEnum)       -> bool : return inputEnum == DavINCi.interfaceState




