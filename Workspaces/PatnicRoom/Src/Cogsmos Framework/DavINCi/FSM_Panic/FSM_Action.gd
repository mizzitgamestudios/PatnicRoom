extends Object
class_name _DavINCi_FSM_Action





func takeActionByEnum(inputEnum,inputType):
	
	if inputIsSelection(inputEnum):   selectByKitSetNr(inputEnum)
	if isKitSelect(inputEnum):        enterKitSet()




func isKitSelect(inputEnum): return inputEnum == ENUM.INPUT_PANIC.INPUTS.INTERFACE.ENTER and ENUM.INPUT_PANIC.PLAYER_STATE.SELECTING == DavINCi.playerState
func inputIsSelection(inputEnum):      return ENUM.INPUT_PANIC.INPUTS.ACTION.SELECT   == inputEnum







func selectByKitSetNr(inputEnum):
	DavINCi.kitSetOfSelection = kitSelect(DavINCi.cachedInput.as_text())
	if is_instance_valid(DavINCi.kitSetOfSelection):
		
		var caxche = API_006_Player.getSelectedTilesComp()
		API_010_TilemapSelector.collectSelectedTiles(DavINCi.kitSetOfSelection)
		var medium = API_004_KitSet.getInitialMedium(DavINCi.kitSetOfSelection)
		var che = API_006_Player.getSelectedTilesComp()
		
		if medium == "LINEA" or medium =="LINEA_AREA": 
			DavINCi.playerState = ENUM.INPUT_PANIC.PLAYER_STATE.NEEDING_DIRECTION
			API_004_KitSet.setPreviewKitSelect(DavINCi.kitSetOfSelection)
		else:
			DavINCi.playerState = ENUM.INPUT_PANIC.PLAYER_STATE.SELECTING
			API_004_KitSet.setFinalKitSelect(DavINCi.kitSetOfSelection)

	else:
		DavINCi.playerState       = ENUM.INPUT_PANIC.PLAYER_STATE.STANDING



func enterKitSet():
	API_004_KitSet.runKitSet(DavINCi.kitSetOfSelection)
	DavINCi.playerState = ENUM.INPUT_PANIC.PLAYER_STATE.FINISHED





func kitSelect(event):                 return API_006_Player.currentChar.getGearedKitSetByNr(int(event)-1)








