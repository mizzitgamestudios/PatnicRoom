extends Component
class_name _5_KitSelect



func setDirectionOfKitset(direction,kitset):
	var reach = kitset.initialSelect["SPACE"].reach
	var pos   = API_011_Player.currentChar.position()
	
	API_014_TilemapSelector.drawCellByPosandReach(direction,pos,reach,"Marker_0_4")
	API_011_Player.resetSelectedTiles()


func getKitSelect(kitSet:KitSetEntity):
	var selectedPos = API_011_Player.getSelectedTiles()
	
	var entsToDraw = setTriggersOnMap(kitSet)
	
	parseArrayToDraw(entsToDraw,kitSet,"Marker_0_5")
	API_011_Player.resetSelectedTiles()




func setTriggersOnMap(kitset):
	API_011_Player.getSelectedTilesComp().resetAlerted()
	var basicTrigger    = API_002_Effect.getTriggerableByBase(kitset,API_011_Player.getSelectedTiles())
	var specificTrigger = API_002_Effect.getTriggerableBySpecific(kitset,basicTrigger)
	
	API_011_Player.getSelectedTilesComp().appendAlerted(specificTrigger)
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


