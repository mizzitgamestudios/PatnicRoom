extends Node
class_name _010_area

static func run(parameters:Dictionary):
	var reach   = parameters["reach"]
	var pos     = parameters["pos"]
	var texture = parameters["texture"]
	
	API_010_TilemapSelector.drawCrosshairOnPos(reach,pos,texture)
	pos.x += reach+1
	
	area_DrawHalf(pos,reach,true,texture)
	area_DrawHalf(pos,reach,false,texture)
	
	area_CutOffPeaks(pos,reach)






static func area_DrawHalf(pos:Vector2,reachToDraw:int,isUpperPart:bool,texture):
	while true:
		if not isUpperPart: pos.y -= -1
		elif isUpperPart: pos.y -= 1
		
		reachToDraw -= 1
		pos.x -= 1
		
		API_010_TilemapSelector.drawCellByPosandReach(ENUM.SOKRATILES.DIRECTION_FOUR.EAST,pos,reachToDraw*2+1,texture)
		
		if reachToDraw == 0 or reachToDraw == 1 or reachToDraw == -1:
			return



static func area_CutOffPeaks(pos:Vector2,reach:int):
	var playerMap = SokraTiles.getPlayer()
	var currentPoint = Vector2(pos.x-reach , pos.y)
	
	playerMap._drawCell(currentPoint.x+reach-1,currentPoint.y,-1)
	playerMap._drawCell(currentPoint.x+reach-reach-reach-1,currentPoint.y,-1)
	
	playerMap._drawCell(currentPoint.x-1,currentPoint.y+reach,-1)
	playerMap._drawCell(currentPoint.x-1,currentPoint.y-reach,-1)
