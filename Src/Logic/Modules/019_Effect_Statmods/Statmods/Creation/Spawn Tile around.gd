extends Object
class_name U_SPAWN_TILE_AROUND



static func run(ent, modValue:Array):
	var tilesToChange = []
	ent       = SokraTiles.getMeatFloor().getEntByPos_quack( ent.pos() )
	ent       = API_017_Atlas.getTileByTextureID(modValue[0])
	var reach = int(modValue[1])
	
	if !is_instance_valid(ent): ent = instance_from_id(ent)
		

	for x in (reach*2)+1:
		for y in (reach*2)+1:
			
			ent         = API_000_BasicTilesAtlas.contextualEntityGeneration_quack(ent)			
			var pos     = ent.pos()

			var newPosX = int(pos.x) + x - reach
			var newPosY = int(pos.y) + y - reach

			var newPos  = Vector2(newPosX,newPosY)
			ent.setPos(newPos)
			
			
			API_009_Tilemap.replaceEntOnPos(ent,newPos)
			API_009_Tilemap.appendDirtyTiles(ent)

