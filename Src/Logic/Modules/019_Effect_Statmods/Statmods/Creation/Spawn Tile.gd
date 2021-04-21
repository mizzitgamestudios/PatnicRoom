extends Object
class_name U_SPAWN_TILE



static func run(ent, modValue:String):
	ent = API_017_Atlas.getTileByTextureID(modValue)
	

	API_009_Tilemap.replaceEntOnPos(ent,ent.pos())
	API_009_Tilemap.appendDirtyTiles(ent)




	
 
