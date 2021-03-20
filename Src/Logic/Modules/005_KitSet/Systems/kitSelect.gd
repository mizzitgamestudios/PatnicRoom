extends Component
class_name _5_KitSelect



func setDirectionOfKitset(direction,kitset):
	API_011_Player.resetSelectedTiles()
	var reach = int( kitset.initialSelect["SPACE"].reach)
	var pos   = API_011_Player.currentChar.position()
	
	#API_014_TilemapSelector.drawCellByPosandReach(direction,pos,reach,"Marker_0_4")
	var cache = API_011_Player.getSelectedTiles()
	for i in reach:
		var select = API_014_TilemapSelector._Util.modPos(pos,direction,i+1)
		API_011_Player.appendSelectedTiles(select)
	API_011_Player.appendSelectedTilesCacheIntoPerma()
	
	
	var entsToDraw = setTriggersOnMap(kitset)
	API_011_Player.currentChar.getComp("C_53_Actor_SELECTED_TILE").appendAlerted(entsToDraw)
	parseArrayToDraw(entsToDraw,kitset,"Marker_0_5")
	API_011_Player.resetSelectedTiles()


func getKitSelect(kitSet:KitSetEntity):
	var selectedPos = API_011_Player.getSelectedTiles()
	
	if !isDirectionNeeded(kitSet):
		var entsToDraw = setTriggersOnMap(kitSet)
		API_011_Player.currentChar.getComp("C_53_Actor_SELECTED_TILE").appendAlerted(entsToDraw)
		parseArrayToDraw(entsToDraw,kitSet,"Marker_0_5")
		API_011_Player.resetSelectedTiles()
		
		
	else:
		var rangeOfKit = kitSet.initialSelect["SPACE"].reach
		var sourcePos  = API_002_Effect.getSourcePos(kitSet)
		API_014_TilemapSelector.drawCrosshairOnPos(int(rangeOfKit),sourcePos,"Marker_0_4")
	
	


func isDirectionNeeded(kitset):
	var initialMedium = kitset.initialSelect["SPACE"].medium
	return initialMedium == "LINEA" or initialMedium == "LINEA_AREA" 

func setTriggersOnMap(kitset):
	var cache = API_011_Player.getSelectedTiles()
	API_011_Player.getSelectedTilesComp().resetAlerted()
	var basicTrigger    = API_002_Effect.getTriggerableByBase(kitset,cache)
	var specificTrigger = API_002_Effect.getTriggerableBySpecific(kitset,basicTrigger)

	return specificTrigger



var cachedLastPos = Vector2(50,50)
func parseArrayToDraw(specificEntities,kitSet,textureID):
	var tilemapSelect = SokraTiles.getSelection()
	for tile in specificEntities.size():
		var currentEntity = specificEntities[tile]
		
		
		tilemapSelect.drawCell_quack(textureID,currentEntity.pos())
		checkForSelectFormatting(kitSet,tile,currentEntity)
		
		cachedLastPos = currentEntity.pos()


func checkForSelectFormatting(kitSet,tile,currentEntity):
	if kitSet.initialSelect["SPACE"].medium == "SELECT":
		API_014_TilemapSelector._Simplex.drawSelectHighlighter(currentEntity.pos(), cachedLastPos)
	
		if tile == 0: API_014_TilemapSelector._Simplex.drawSelectBorder(kitSet)


