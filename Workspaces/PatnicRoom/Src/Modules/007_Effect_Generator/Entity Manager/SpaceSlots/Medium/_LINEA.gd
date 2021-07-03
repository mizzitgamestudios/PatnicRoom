extends Object
class_name Effect_Space_Medium_Linea


static func run(reach, sourcePos, texture):  
	API_010_TilemapSelector.drawCrosshairOnPos(reach, sourcePos, texture)









static func getDoc():
	return {
		
		"keyword"          : "LINEA",
		"name"             : "linea",

		"unit"             : "SPACE",    
		"stat"             : "MEDIUM",

		"toString"        : "draws a cross at soruce in all four direction,a directional input set the final select on the appropiated line",

		"inputModule" : "VOID"

	}





