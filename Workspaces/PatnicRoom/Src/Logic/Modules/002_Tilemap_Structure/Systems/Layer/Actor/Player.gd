extends SokraTiles_Chunk_Actors
class_name SokraTiles_Chunk_Player


# ----- INITIALICE --------------------------------------------------------------- ##

var player :PlayerEntity = API_006_Player.currentChar

func _ready() -> void:
	
	
	SokraTiles.addChunkToKnownLayers(ENUM.SOKRATILES_LAYER.ACTOR_PLAYER,self)
	
	_drawCell( player.textureID(), player.position() )
	
	updateCammera()
	.get_tree().get_root().get_node("Node2D").recievePlayer(self)

 

# ----- MOVE --------------------------------------------------------------------- ##

func movePlayer(directionEnum):
	.moveActor(directionEnum,player)
	 
	updateCammera()
	API_002_Tilemap.interpreteTile(player.position(), self )	


func updateCammera():   .get_node("Camera2D").updateCenter( player.position() )
