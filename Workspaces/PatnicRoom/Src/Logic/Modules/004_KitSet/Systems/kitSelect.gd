extends Component
class_name _5_KitSelect



func setDirectionOfKitset(direction,kitset):
	API_006_Player.resetSelectedTiles()
	var reach = int( kitset.initialSelect["SPACE"].reach)
	var pos   = API_006_Player.currentChar.position()
	
	#API_010_TilemapSelector.drawCellByPosandReach(direction,pos,reach,"Marker_0_4")
	var cache = API_006_Player.getSelectedTiles()
	for i in reach:
		var select = API_010_TilemapSelector._Util.modPos(pos,direction,i+1)
		API_006_Player.appendSelectedTiles(select)
	API_006_Player.appendSelectedTilesCacheIntoPerma()
	
	
	var entsToDraw = setTriggersOnMap(kitset)
	API_006_Player.currentChar.getComp("C_53_Actor_SELECTED_TILE").appendAlerted(entsToDraw)
	parseArrayToDraw(entsToDraw,kitset,"Marker_0_5")
	API_006_Player.resetSelectedTiles()


func getKitSelect(kitSet:KitSetEntity):
	var selectedPos = API_006_Player.getSelectedTiles()
	
	if !isDirectionNeeded(kitSet):
		var entsToDraw = setTriggersOnMap(kitSet)
		API_006_Player.currentChar.getComp("C_53_Actor_SELECTED_TILE").appendAlerted(entsToDraw)
		parseArrayToDraw(entsToDraw,kitSet,"Marker_0_5")
		API_006_Player.resetSelectedTiles()
		
		
	else:
		var rangeOfKit = kitSet.initialSelect["SPACE"].reach
		var sourcePos  = API_007_Effect.getSourcePos(kitSet)
		API_010_TilemapSelector.drawCrosshairOnPos(int(rangeOfKit),sourcePos,"Marker_0_4")
	
	


func isDirectionNeeded(kitset):
	var initialMedium = kitset.initialSelect["SPACE"].medium
	return initialMedium == "LINEA" or initialMedium == "LINEA_AREA" 

func setTriggersOnMap(kitset):
	var cache = API_006_Player.getSelectedTiles()
	API_006_Player.getSelectedTilesComp().resetAlerted()
	var basicTrigger    = API_007_Effect.getTriggerableByBase(kitset,cache)
	var specificTrigger = API_007_Effect.getTriggerableBySpecific(kitset,basicTrigger)

	return specificTrigger



var cachedLastPos = Vector2(50,50)
func parseArrayToDraw(specificEntities,kitSet,textureID):
	var tilemapSelect = SokraTiles.getSelection()
	for tile in specificEntities.size():
		var currentEntity = specificEntities[tile]
		
		
		tilemapSelect.drawCell_quack(textureID,currentEntity.pos())
		checkForSelectFormatting(kitSet,currentEntity)
		
		cachedLastPos = currentEntity.pos()


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
	
		if 0 == 0: 
			var pos = API_006_Player.currentChar.position()
			var posMod = int(kitSet.initialSelect["SPACE"].reach)
			
			tilemap.drawCell_quack("Marker_0_4",Vector2(currentEntity.position.x-posMod, currentEntity.position.y        ))
			tilemap.drawCell_quack("Marker_0_4",Vector2(currentEntity.position.x+posMod, currentEntity.position.y        ))
			tilemap.drawCell_quack("Marker_0_4",Vector2(currentEntity.position.x,        currentEntity.position.y+posMod ))
			tilemap.drawCell_quack("Marker_0_4",Vector2(currentEntity.position.x,        currentEntity.position.y-posMod ))


