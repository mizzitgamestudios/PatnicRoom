extends Node
class_name _014_Simplex




func drawCellByPosandReach(directionEnum:int,pos:Vector2,times:int,texture):
	var tilemap = SokraTiles.getSelection()
	var tileCollection = []
	
	for i in times:
		
		var posToDraw = API_014_TilemapSelector._Util.modPos(pos,directionEnum,i+1)
		tilemap.drawCell_quack(str(texture),int(posToDraw.x),int(posToDraw.y))
		tileCollection.append(posToDraw)
		API_011_Player.currentChar.getComp(C_53_Actor_SELECTED_TILE.name_quack()).addToCache(posToDraw)
		
	
	API_011_Player.currentChar.getComp(C_53_Actor_SELECTED_TILE.name_quack()).appendCacheIntoPerma()



func drawMarkerForQuad(reach:int,pos:Vector2,texture):
	var tilemap = SokraTiles.getPlayer()
	var border = reach/2
	var start = Vector2(pos.x-border,pos.y-border)
	
	for i in border:
		for j in border:
			
			var currentPoint = Vector2(start.x+i , start.y+j)
			
			if currentPoint != pos:
				tilemap._drawCell(currentPoint.x,currentPoint.y,texture)
				API_011_Player.appendSelectedTiles(currentPoint)
	API_011_Player.appendSelectedTilesCacheIntoPerma()


func drawSelectHighlighter(pos:Vector2, cachedLastPos):
	var currentPos: Array = [
		Vector2(pos.x,pos.y-1),
		Vector2(pos.x,pos.y+1),
		Vector2(pos.x-1,pos.y),
		Vector2(pos.x+1,pos.y)]
	
	var tilemap = SokraTiles.getSelection()
	
	for i in 4:
		if cachedLastPos != (currentPos[i]):
			tilemap.drawCell_quack("Marker_1_4",currentPos[i])
	


func drawSelectBorder(kitset:KitSetEntity):
	var tilemap = SokraTiles.getSelection()
	var pos = API_011_Player.currentChar.position()
	var posMod = int(kitset.initialSelect["SPACE"].reach)
	
	tilemap.drawCell_quack("Marker_0_4",Vector2(pos.x-posMod,pos.y))
	tilemap.drawCell_quack("Marker_0_4",Vector2(pos.x+posMod,pos.y))
	tilemap.drawCell_quack("Marker_0_4",Vector2(pos.x,pos.y+posMod))
	tilemap.drawCell_quack("Marker_0_4",Vector2(pos.x,pos.y-posMod))
