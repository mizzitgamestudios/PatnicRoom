extends Object
class_name U_CHANGE_TEXTURE



static func run(selectedPos, modValue:String):
	var texture = selectedPos.getComp("C_2_ANY_TEXTURE_ID")
	
	HeGEL.changeStat(selectedPos,"C_2_ANY_TEXTURE_ID",modValue)
	
	API_009_Tilemap.appendDirtyTiles(selectedPos)

	
 
