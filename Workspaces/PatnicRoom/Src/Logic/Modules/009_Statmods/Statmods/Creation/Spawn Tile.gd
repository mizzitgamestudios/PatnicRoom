extends Object
class_name U_SPAWN_TILE



static func run(ent, modValue:String):
	ent = API_001_Atlas.getTileByTextureID(modValue)
	

	API_002_Tilemap.replaceEntOnPos(ent,ent.pos())
	API_002_Tilemap.appendDirtyTiles(ent)




	
 
