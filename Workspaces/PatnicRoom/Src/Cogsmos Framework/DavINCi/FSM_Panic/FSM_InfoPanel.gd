extends Object
class_name _DavINCi_FSM_InfoPanel


<<<<<<< HEAD
# ----- INITIALICE ----------------------------------------------------------- ##


func _init() -> void:   Signals.connect("animation_finished",self,"freeInfoPnale")


var isRoot       : bool
var isSame       : bool
=======
var isRoot       : bool
var isSame       : bool
var isCLIActive  : bool = true
>>>>>>> 14ed4bc523602584d0fecdfce3fc61f9ee8a2684

var infoPanelInstance
var newInfopanelInstance

var infoPanelToLoad = {
<<<<<<< HEAD
	ENUM.INPUT_PANIC.INFO.KITS    : "res://Src/scenes/Gameloop/PanicMode/Subscenes/Kits Side Panel/Kits.tscn",
	ENUM.INPUT_PANIC.INFO.JURNAL  : "res://Src/scenes/Gameloop/PanicMode/Subscenes/Inv Side Panel/Inv.tscn",
	ENUM.INPUT_PANIC.INFO.MONITOR : "res://Src/scenes/Gameloop/PanicMode/Subscenes/Monitor Side Panel/Monitor.tscn",
	ENUM.INPUT_PANIC.INFO.NEWS    : "res://Src/scenes/Gameloop/PanicMode/Subscenes/News Side Panel/News.tscn",
}
 


# ----- INPUT HANDLER -------------------------------------------------------- ##


func takeActionByEnum(inputEnum, inputType):

	# input: F3 #
	if isInputToggleCLI(inputEnum): manageCLI()
	
	# input: N || M || J || K #
	else:
		newInfopanelInstance = load(infoPanelToLoad[inputEnum]).instance()
		
		if is_instance_valid(infoPanelInstance): playExitAnimation()
		else:                                    playEnterAnimation()
		


# ----- CLI ------------------------------------------------------------------ ##


var cliNode
var isCLIActive  : bool = true


func manageCLI():
	isCLIActive = !isCLIActive

=======
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
	
>>>>>>> 14ed4bc523602584d0fecdfce3fc61f9ee8a2684
	if !isCLIActive:
		cliNode = load("res://Src/scenes/Unique/API_017_CLI/CLI.tscn").instance()
		DavINCi.gameloopScene.add_child(cliNode)
	
	else: DavINCi.gameloopScene.remove_child(cliNode)


<<<<<<< HEAD
# ----- VALIDATOR ------------------------------------------------------------ ##
		

func isInputToggleCLI(inputEnum): return inputEnum == ENUM.INPUT_PANIC.INPUTS.INFO.CLI



# ----- ANIMATION ------------------------------------------------------------ ##
=======
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
>>>>>>> 14ed4bc523602584d0fecdfce3fc61f9ee8a2684


func playEnterAnimation():
	DavINCi.gameloopScene.get_node("SidePanel").add_child(newInfopanelInstance)
	DavINCi.gameloopScene.get_node("SidePanel").get_child(0).buildRef(self)
	infoPanelInstance = newInfopanelInstance
	

<<<<<<< HEAD
=======


>>>>>>> 14ed4bc523602584d0fecdfce3fc61f9ee8a2684
func playExitAnimation():
	DavINCi.gameloopScene.get_node("SidePanel").get_child(0).exitAnimation(self)



<<<<<<< HEAD

	
=======
# ----- VALIDATOR ------------------------------------------------------------ ##


func needsCLIConfirmationi(inputEnum) -> bool : return isCLIActive and inputEnum == ENUM.INPUTS.INTERFACE.ENTER

func isNotCLI(inputEnum)              -> bool : return inputEnum != ENUM.INPUTS.INFO.CLI
func isCLI(inputEnum)                 -> bool : return !isNotCLI(inputEnum)

func isSameInfoPanel(inputEnum)       -> bool : return inputEnum == DavINCi.interfaceState
>>>>>>> 14ed4bc523602584d0fecdfce3fc61f9ee8a2684




