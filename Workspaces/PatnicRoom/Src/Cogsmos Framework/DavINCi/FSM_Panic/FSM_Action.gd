extends Object
class_name _DavINCi_FSM_Action





func takeActionByEnum(inputEnum):
	var inputType = _Davinci_getter.getInputTypeByEnum(inputEnum)
	
	
	if inputIsSelection(inputEnum):     
		selectByKitSetNr(inputEnum)
	
	pass





func inputIsSelection(inputEnum):      return ENUM.INPUTS.ACTION.SELECT   == inputEnum
func kitSelect(event):         return API_006_Player.currentChar.getKitOfKitset(int(event)-1)



func selectByKitSetNr(inputEnum):
	DavINCi.kitSetOfSelection = kitSelect(DavINCi.cachedInput.as_text())
	var kitsetCache = DavINCi.kitSetOfSelection
	DavINCi.playerState = ENUM.PANIC_PLAYER_STATE.SELECTING
	if is_instance_valid(kitsetCache):
		
		API_004_KitSet.getInitialKitsetSelect(kitsetCache)
		
		API_010_TilemapSelector.drawMarkerByKitset(kitsetCache)
		API_004_KitSet.getKitSelect(kitsetCache)
		
		if kitsetCache != null:
			var medium = kitsetCache.initialSelect["SPACE"].medium
			
			if medium == "LINEA" or medium =="LINEA_AREA": DavINCi.playerState = ENUM.PANIC_PLAYER_STATE.NEEDING_DIRECTION
			else:                                          DavINCi.playerState = ENUM.PANIC_PLAYER_STATE.SELECTING




func isKitSelect(inputEnum): return inputEnum == ENUM.INPUTS.INTERFACE.ENTER and ENUM.PANIC_PLAYER_STATE.SELECTING == DavINCi.playerState



func enterKitSet():
	API_004_KitSet.runKitSet(DavINCi.kitSetOfSelection)
	DavINCi.playerState = ENUM.PANIC_PLAYER_STATE.FINISHED
