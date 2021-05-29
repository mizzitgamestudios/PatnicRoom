extends Object
class_name _DavINCi_FSM_Interface





func takeActionByEnum(inputEnum):
	var inputType = _Davinci_getter.getInputTypeByEnum(inputEnum)
	
	if isKitSelect(inputEnum):  enterKitSet()
	
	
	pass




func isKitSelect(inputEnum): return inputEnum == ENUM.INPUTS.INTERFACE.ENTER and ENUM.PANIC_PLAYER_STATE.SELECTING == DavINCi.playerState



func enterKitSet():
	API_004_KitSet.runKitSet(DavINCi.kitSetOfSelection)
	DavINCi.playerState = ENUM.PANIC_PLAYER_STATE.FINISHED
