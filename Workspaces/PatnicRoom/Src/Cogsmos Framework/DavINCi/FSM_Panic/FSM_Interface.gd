extends Object
class_name _DavINCi_FSM_Interface


<<<<<<< HEAD
# ----- INPUT HANDLER -------------------------------------------------------- ##


func takeActionByEnum(inputEnum, inputType):

	# input: ENTER   &&   player: SELECTING #
	if isKitSelect(inputEnum):  enterKitSet()
	



# ----- VALIDATOR ------------------------------------------------------------ ##

func isKitSelect(inputEnum): return inputEnum == ENUM.INPUT_PANIC.INPUTS.INTERFACE.ENTER and ENUM.INPUT_PANIC.PLAYER_STATE.SELECTING == DavINCi.playerState



# ----- PROCESSES ------------------------------------------------------------- ##
=======



func takeActionByEnum(inputEnum):
	var inputType = _Davinci_getter.getInputTypeByEnum(inputEnum)
	
	if isKitSelect(inputEnum):  enterKitSet()
	
	
	pass




func isKitSelect(inputEnum): return inputEnum == ENUM.INPUTS.INTERFACE.ENTER and ENUM.PANIC_PLAYER_STATE.SELECTING == DavINCi.playerState

>>>>>>> 14ed4bc523602584d0fecdfce3fc61f9ee8a2684


func enterKitSet():
	API_004_KitSet.runKitSet(DavINCi.kitSetOfSelection)
<<<<<<< HEAD
	DavINCi.playerState = ENUM.INPUT_PANIC.PLAYER_STATE.FINISHED
=======
	DavINCi.playerState = ENUM.PANIC_PLAYER_STATE.FINISHED
>>>>>>> 14ed4bc523602584d0fecdfce3fc61f9ee8a2684
