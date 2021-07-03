extends SokraTiles_Chunk_Basic
class_name SokraTiles_Chunk_Actors


var dirtyTiles = []

func initialice(layerEnum,layerNode) -> void:
	var layerToParse = SokraTiles.getParsedLayer(layerEnum)
	SokraTiles.addChunkToKnownLayers(layerEnum,layerNode)
	
	#Signals.connect("Actor_Turn_Finished",self,"_cleanMap")


func _cleanMap():
	for i in dirtyTiles.size():
		var currentSet = dirtyTiles[i]
		
		var oldPos = currentSet[0]
		var newPos = currentSet[1]
		var ent    = entsOnMap[oldPos]
	
		._drawCell(oldPos.x,oldPos.y,-1)
		._drawCell(newPos.x,newPos.y,ent.textureID.value)



func _addToDirtyTiles(oldPos:Vector2,newPos:Vector2):
	var arr = [oldPos,newPos]
	dirtyTiles.append(arr)


func moveActor(directionEnum,ent):
<<<<<<< HEAD
	var newPos = API_010_TilemapSelector.getMovePos(ent.pos(),directionEnum)
	var oldPos = ent.pos()
=======
	var newPos = API_010_TilemapSelector.getMovePos(ent.position(),directionEnum)
	var oldPos = ent.position()
>>>>>>> 14ed4bc523602584d0fecdfce3fc61f9ee8a2684

	if isTileWalkable(newPos):

		_addToDirtyTiles(oldPos,newPos)
		ent.setPos(newPos)
		_drawCell(-1, oldPos)
		_drawCell(ent.textureID(), newPos)
	
	attachCondIfPossible(newPos,ent)
	


func isTileWalkable(pos:Vector2):
	var returnBool = true
	
	if SokraTiles.getMeatInteract().entsOnMap.has(pos):
		return SokraTiles.getMeatInteract().getEntByPos_quack(pos).getCompValue("C_1_ANY_IS_WALKABLE")
	else:
		var ent = SokraTiles.getMeatFloor().getEntByPos_quack(pos)
		return ent.isWalkable()



func attachCondIfPossible(newPos,ent):
	var tile = SokraTiles.getMeatFloor().getEntByPos_quack(newPos)
	if tile.has("C_64_APPLY_CONDITION_WALKING"):

		var condName     = tile.getComp("C_64_APPLY_CONDITION_WALKING").condIndex
		var condDuration = tile.getComp("C_64_APPLY_CONDITION_WALKING").duration

		API_008_Condition.attachConditionToEnt(ent, condName, int(condDuration) )
