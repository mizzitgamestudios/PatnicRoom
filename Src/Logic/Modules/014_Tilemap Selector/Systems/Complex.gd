extends Node
class_name _014_Complex



func drawCrosshair(reach:int,pos:Vector2,texture):	
	API_014_TilemapSelector._Simplex.drawCellByPosandReach(ENUM.DIRECTION_FOUR.NORTH,pos,reach,texture)
	API_014_TilemapSelector._Simplex.drawCellByPosandReach(ENUM.DIRECTION_FOUR.SOUTH,pos,reach,texture)
	API_014_TilemapSelector._Simplex.drawCellByPosandReach(ENUM.DIRECTION_FOUR.WEST,pos,reach,texture)
	API_014_TilemapSelector._Simplex.drawCellByPosandReach(ENUM.DIRECTION_FOUR.EAST,pos,reach,texture)



func drawArea(reach:int,pos:Vector2,texture):
	drawCrosshair(reach,pos,texture)
	pos.x += reach+1
	
	area_DrawHalf(pos,reach,true,texture)
	area_DrawHalf(pos,reach,false,texture)
	
	area_CutOffPeaks(pos,reach)



func drawMarker(reach:int,tileName:String,tilemap:SokraTiles_Chunk_Basic,pos:Vector2,texture):
	var playerMap = SokraTiles.getPlayer()
	var start = Vector2(pos.x-reach/2 , pos.y-reach/2)
	

	for i in reach:
		for j in reach:
			
			var currentPoint = Vector2(start.x+i , start.y+j)
			var tile = tilemap.getTileEntByPos(currentPoint.x , currentPoint.y)
			
			if tile.textureID() == tileName and currentPoint != pos:
				
				playerMap._drawCell(currentPoint.x,currentPoint.y,texture)
				API_011_Player.appendSelectedTiles(currentPoint)
				
	
	API_011_Player.currentChar.selectedTiles.appendCacheIntoPerma()
	API_014_TilemapSelector.appendCacheIntoPerma()






func area_DrawHalf(pos:Vector2,reachToDraw:int,isUpperPart:bool,texture):
	while true:
		if not isUpperPart: pos.y -= -1
		elif isUpperPart: pos.y -= 1
		
		reachToDraw -= 1
		pos.x -= 1
		
		API_014_TilemapSelector._Simplex.drawCellByPosandReach(ENUM.DIRECTION_FOUR.WEST,pos,reachToDraw*2+1,texture)
		
		if reachToDraw == 0 or reachToDraw == 1 or reachToDraw == -1:
			return



func area_CutOffPeaks(pos:Vector2,reach:int):
	var playerMap = SokraTiles.getPlayer()
	var currentPoint = Vector2(pos.x-reach , pos.y)
	
	playerMap._drawCell(currentPoint.x+reach-1,currentPoint.y,-1)
	playerMap._drawCell(currentPoint.x+reach-reach-reach-1,currentPoint.y,-1)
	
	playerMap._drawCell(currentPoint.x-1,currentPoint.y+reach,-1)
	playerMap._drawCell(currentPoint.x-1,currentPoint.y-reach,-1)






