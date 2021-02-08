extends SokraTiles_Chunk
class_name SokraTiles_Chunk_Player

################################################################################
##  --- Init ---                                                              ##
################################################################################


var playerEnt :TileEntity

var playerTexture :int
var playerPos :Vector2


func _ready() -> void:
	var parsedTilemap = SokraTiles.layerManager.getLayer(ENUM.SOKRATILES_LAYER.ACTOR_PLAYER)
	.fillDictsForXRef(parsedTilemap)
	
	initPlayer()
	.get_tree().get_root().get_node("Node2D").recievePlayer(self)


func initPlayer() -> void:
	playerEnt = findPlayer()
	
	.AddTextureAtlasNrToEnt(playerEnt)
	playerTexture = int(playerEnt.staticTilesetCellNr())
	
	.drawTileByPos(playerPos.x,playerPos.y)
	.get_node("Camera2D").updateCenter(playerPos)

func findPlayer():
	for i in .getTilemapReference().size():
		for j in .getTilemapReference().size():
			if str(.getTilemapReference()[i][j]) != "-1":
				playerPos = Vector2(i,j)
				return instance_from_id(.getTilemapReference()[i][j])



################################################################################
##  --- Input ---                                                             ##
################################################################################



func interpreteDirection(event:InputEventKey):
	var posMod:Vector2
		
	if event.is_action_pressed(ENUM.PANIC_WALK_DIRECTION.NORTH): 
		posMod = Vector2(playerPos.x, playerPos.y-1)
		
	elif event.is_action_pressed(ENUM.PANIC_WALK_DIRECTION.SOUTH):
		posMod = Vector2(playerPos.x, playerPos.y+1) 
		
	elif event.is_action_pressed(ENUM.PANIC_WALK_DIRECTION.WEST):
		posMod = Vector2(playerPos.x-1, playerPos.y)
		
	elif event.is_action_pressed(ENUM.PANIC_WALK_DIRECTION.EAST):
		posMod = Vector2(playerPos.x+1, playerPos.y)
		
	playerPos.x = posMod.x
	playerPos.y = posMod.y
	API_009_Tilemap._tileInterpreter.interpreteTileNr(playerPos,self)
	API_009_Tilemap.playerPos = playerPos


func movePlayer():
	.clear()
	.setCell(playerPos.x,playerPos.y,playerTexture)



	
	

