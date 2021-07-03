extends Object
class_name _DavINCi_FSM_Action





<<<<<<< HEAD
func takeActionByEnum(inputEnum,inputType):
	
	if inputIsSelection(inputEnum):   selectByKitSetNr(inputEnum)
	if isKitSelect(inputEnum):        enterKitSet()




func isKitSelect(inputEnum): return inputEnum == ENUM.INPUT_PANIC.INPUTS.INTERFACE.ENTER and ENUM.INPUT_PANIC.PLAYER_STATE.SELECTING == DavINCi.playerState
func inputIsSelection(inputEnum):      return ENUM.INPUT_PANIC.INPUTS.ACTION.SELECT   == inputEnum
=======
func takeActionByEnum(inputEnum):
	var inputType = _Davinci_getter.getInputTypeByEnum(inputEnum)
	
	
	if inputIsSelection(inputEnum):     
		selectByKitSetNr(inputEnum)
	
	pass

>>>>>>> 14ed4bc523602584d0fecdfce3fc61f9ee8a2684




<<<<<<< HEAD
=======
func inputIsSelection(inputEnum):      return ENUM.INPUTS.ACTION.SELECT   == inputEnum
func kitSelect(event):         return API_006_Player.currentChar.getKitOfKitset(int(event)-1)
>>>>>>> 14ed4bc523602584d0fecdfce3fc61f9ee8a2684



func selectByKitSetNr(inputEnum):
	DavINCi.kitSetOfSelection = kitSelect(DavINCi.cachedInput.as_text())
<<<<<<< HEAD
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

=======
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
>>>>>>> 14ed4bc523602584d0fecdfce3fc61f9ee8a2684




<<<<<<< HEAD



=======
func isKitSelect(inputEnum): return inputEnum == ENUM.INPUTS.INTERFACE.ENTER and ENUM.PANIC_PLAYER_STATE.SELECTING == DavINCi.playerState



func enterKitSet():
	API_004_KitSet.runKitSet(DavINCi.kitSetOfSelection)
	DavINCi.playerState = ENUM.PANIC_PLAYER_STATE.FINISHED
>>>>>>> 14ed4bc523602584d0fecdfce3fc61f9ee8a2684
