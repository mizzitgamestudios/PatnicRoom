extends Node
class_name _010_select

static func run(parameters:Dictionary):
	var reach     = parameters["reach"]
	var pos       = parameters["pos"]
	var texture   = parameters["texture"]
	var tilename  = parameters["tilename"]
	var tilemap   = parameters["tilemap"]
	
	var playerMap = SokraTiles.getPlayer()
	var start     = Vector2(pos.x-reach/2 , pos.y-reach/2)
	

	for i in reach:
		for j in reach:
			
			var currentPoint = Vector2(start.x+i , start.y+j)
			var tile         = tilemap.getTileEntByPos(currentPoint.x , currentPoint.y)
			
			if tile.textureID() == tilename and currentPoint != pos:
				playerMap._drawCell(currentPoint.x,currentPoint.y,texture)
				API_006_Player.appendSelectedTiles(currentPoint)
				
	
	API_006_Player.currentChar.selectedTiles.appendCacheIntoPerma()
	API_010_TilemapSelector.appendCacheIntoPerma()
