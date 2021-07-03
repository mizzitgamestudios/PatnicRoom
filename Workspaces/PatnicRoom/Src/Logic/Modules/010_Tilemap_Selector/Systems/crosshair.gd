extends Node
class_name _010_linea

static func run(parameters:Dictionary):
	var reach   = parameters["reach"]
	var pos     = parameters["pos"]
	var texture = parameters["texture"]
	
		
	API_010_TilemapSelector.drawCellByPosandReach(ENUM.DIRECTION_FOUR.NORTH,pos,reach,texture)
	API_010_TilemapSelector.drawCellByPosandReach(ENUM.DIRECTION_FOUR.SOUTH,pos,reach,texture)
	API_010_TilemapSelector.drawCellByPosandReach(ENUM.DIRECTION_FOUR.WEST,pos,reach,texture)
	API_010_TilemapSelector.drawCellByPosandReach(ENUM.DIRECTION_FOUR.EAST,pos,reach,texture)



