extends Node 
class_name _010_quad

static func run(parameters:Dictionary):
	var reach   = parameters["reach"]
	var pos     = parameters["pos"]
	var texture = parameters["texture"]

	var tilemap = SokraTiles.getPlayer()
	var border  = reach/2
	var start   = Vector2(pos.x-border,pos.y-border)
	
	
	for i in border:
		for j in border:
			
			var currentPoint = Vector2(start.x+i , start.y+j)
			
			if currentPoint != pos:
				tilemap._drawCell(currentPoint.x,currentPoint.y,texture)
				API_006_Player.appendSelectedTiles(currentPoint)
	API_006_Player.appendSelectedTilesCacheIntoPerma()
