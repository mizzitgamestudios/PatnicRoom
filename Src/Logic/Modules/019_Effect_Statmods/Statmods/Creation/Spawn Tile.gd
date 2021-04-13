extends Object
class_name U_SPAWN_TILE



static func run(selectedPos, modValue:String):
	var ent = API_017_Atlas.getTileByTextureID(modValue)
	

	API_009_Tilemap.replaceEntOnPos(ent,selectedPos.pos())
	API_009_Tilemap.appendDirtyTiles(ent)




	
 
