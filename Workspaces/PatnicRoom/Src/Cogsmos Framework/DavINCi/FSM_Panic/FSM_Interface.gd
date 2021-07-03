extends Object
class_name _DavINCi_FSM_Interface


# ----- INPUT HANDLER -------------------------------------------------------- ##


func takeActionByEnum(inputEnum, inputType):

	# input: ENTER   &&   player: SELECTING #
	if isKitSelect(inputEnum):  enterKitSet()
	



# ----- VALIDATOR ------------------------------------------------------------ ##

func isKitSelect(inputEnum): return inputEnum == ENUM.INPUT_PANIC.INPUTS.INTERFACE.ENTER and ENUM.INPUT_PANIC.PLAYER_STATE.SELECTING == DavINCi.playerState



# ----- PROCESSES ------------------------------------------------------------- ##


func enterKitSet():
	API_004_KitSet.runKitSet(DavINCi.kitSetOfSelection)
	DavINCi.playerState = ENUM.INPUT_PANIC.PLAYER_STATE.FINISHED
