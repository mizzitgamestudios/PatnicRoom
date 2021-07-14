extends Node
class_name _010_universal



static func run(parameters:Dictionary):
	var reach          = parameters["reach"]
	var pos            = parameters["pos"]
	var texture        = parameters["texture"]
	var directionEnum  = parameters["direction"]
	
	var tilemap        = SokraTiles.getSelection()
	var tileCollection = []
	

	for i in reach:
		var posToDraw = API_010_TilemapSelector._Util.modPos(pos,directionEnum,i+1)
		tilemap.drawCell_quack(str(texture),int(posToDraw.x),int(posToDraw.y))
		tileCollection.append(posToDraw)
		API_006_Player.currentChar.getComp(C_53_Actor_SELECTED_TILE.name_quack()).addToCache(posToDraw)
		
	
	API_006_Player.currentChar.getComp(C_53_Actor_SELECTED_TILE.name_quack()).appendCacheIntoPerma()
