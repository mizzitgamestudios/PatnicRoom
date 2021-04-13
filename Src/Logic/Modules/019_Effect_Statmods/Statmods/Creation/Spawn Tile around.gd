extends Object
class_name U_SPAWN_TILE_AROUND



static func run(selectedPos, modValue:Array):
	var tilesToChange = []
	selectedPos       = SokraTiles.getMeatFloor().getEntByPos_quack( selectedPos.pos() )
	var ent           = API_017_Atlas.getTileByTextureID(modValue[0])
	var reach         = int(modValue[1])
	
	if !is_instance_valid(selectedPos): selectedPos = instance_from_id(selectedPos)
		

	for x in (reach*2)+1:
		for y in (reach*2)+1:
			ent         = API_000_BasicTilesAtlas.contextualEntityGeneration_quack(ent)			
			var pos     = selectedPos.pos()

			var newPosX = int(pos.x) + x - reach
			var newPosY = int(pos.y) + y - reach

			var newPos  = Vector2(newPosX,newPosY)
			ent.setPos(newPos)
			
			
			API_009_Tilemap.replaceEntOnPos(ent,newPos)
			API_009_Tilemap.appendDirtyTiles(ent)

