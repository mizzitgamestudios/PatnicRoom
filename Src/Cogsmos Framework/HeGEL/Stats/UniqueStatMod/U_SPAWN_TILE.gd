extends Object
class_name U_SPAWN_TILE



static func run(selectedPos, modValue:String):
	var ent = API_017_Atlas.getTileByTextureID(modValue)
	

	API_009_Tilemap.replaceEntOnPos(ent,selectedPos.pos())
#	var debug = SokraTiles.getMeatFloor().entsOnMap
#	var debugPos = selectedPos.pos()
#	
#	var cache = selectedPos.pos()
#	ent.setPos(Vector2(cache.x,cache.y))
#	
#	debug[debugPos] = ent.get_instance_id()

	API_009_Tilemap.appendDirtyTiles(ent)




	
 
