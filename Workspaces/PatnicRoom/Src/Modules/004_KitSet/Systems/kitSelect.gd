extends Component
class_name _5_KitSelect


# ----- MAIN --------------------------------------------------------------------- ##


func setFinalKitSelect(kitset):
	
	#API_006_Player.resetSelectedTiles()
	var entsToDraw = setTriggersOnMap(kitset)
	API_006_Player.getSelectedTilesComp().appendAlerted(entsToDraw)
	parseArrayToDraw(entsToDraw,kitset,"Marker_0_5")
	API_006_Player.resetSelectedTiles()


func setPreviewKitSelect(kitSet):
	var rangeOfKit = API_004_KitSet.getInitialReach(kitSet)
	var sourcePos  = API_007_Effect.getSourcePos(kitSet)
	API_010_TilemapSelector.drawCrosshairOnPos(int(rangeOfKit),sourcePos,"Marker_1_4")



func setDirectionOfKitset(direction,kitset):
	API_006_Player.resetSelectedTiles()
	var reach = API_004_KitSet.getInitialReach(kitset)
	var pos   = API_006_Player.currentChar.pos()
	
	for i in reach:
		var select = API_010_TilemapSelector._Util.modPos(pos,direction,i+1)
		API_006_Player.appendSelectedTiles(select)
	API_006_Player.appendSelectedTilesCacheIntoPerma()
	
	setFinalKitSelect(kitset)



# ----- SETTER ------------------------------------------------------------------- ##


func setTriggersOnMap(kitset):
	var cache = API_006_Player.getSelectedTiles()
	API_006_Player.getSelectedTilesComp().resetAlerted()
	var saniticedCache = saniticeInvalidSelects(cache)

	var basicTrigger    = API_007_Effect.getTriggerableByBase(kitset,saniticedCache)
	var specificTrigger = API_007_Effect.getTriggerableBySpecific(kitset,basicTrigger)

	return specificTrigger



var cachedLastPos = Vector2(50,50)
func parseArrayToDraw(specificEntities,kitSet,textureID):
	var tilemapSelect = SokraTiles.getSelection()
	for currentEntity in specificEntities:
	
		tilemapSelect.drawCell_quack(textureID,currentEntity.pos())
		checkForSelectFormatting(kitSet,currentEntity)
		
		cachedLastPos = currentEntity.pos()



func saniticeInvalidSelects(allSelects:Array):
	for currentSelect in allSelects:
		
		if currentSelect.y > 100 :  allSelects.erase(currentSelect)
		if currentSelect.x > 100 :  allSelects.erase(currentSelect)
		
		if currentSelect.y < 0   :  allSelects.erase(currentSelect)
		if currentSelect.x < 0   :  allSelects.erase(currentSelect)
		
	
	
	return allSelects


# ----- HELPER ------------------------------------------------------------------- ##


func isDirectionNeeded(slot):  return ["LINEA","LINEA_AREA"].has(slot["SPACE"].medium)


func checkForSelectFormatting(kitSet,currentEntity):
	if kitSet.initialSelect["SPACE"].medium == "SELECT":
	
		var currentPos: Array = [
			Vector2(currentEntity.posX(),   currentEntity.posY()-1 ),
			Vector2(currentEntity.posX(),   currentEntity.posY()+1 ),
			Vector2(currentEntity.posX()-1, currentEntity.posY()   ),
			Vector2(currentEntity.posX()+1, currentEntity.posY()   )]
		
		var tilemap = SokraTiles.getSelection()
		
		for i in 4:
			if cachedLastPos != (currentPos[i]):
				tilemap.drawCell_quack("Marker_1_4",currentPos[i])


