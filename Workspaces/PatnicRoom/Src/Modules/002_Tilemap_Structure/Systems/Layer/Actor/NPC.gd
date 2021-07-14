extends SokraTiles_Chunk_Actors
class_name SokraTiles_Chunk_NPC


# ----- INITIALICE ----------------------------------------------------------- ##

func _ready() -> void:
	.initialice(ENUM.SOKRATILES.LAYER.ACTOR_NPC,self)
	API_011_ProcgenActor.API_011_ProcgenActor()
	entsOnMap = SokraTiles.Actors_on_map
	

	for currentActorInstanceID in entsOnMap.keys():
		var currentActor = instance_from_id(currentActorInstanceID)
		drawCell_quack( currentActor.textureID(), currentActor.pos() )

 

# ----- GETTER --------------------------------------------------------------- ##

# FUNC | OVERLOADED |                                             
# VAR [mainPos: Vector2] [altPos: default]                        
# VAR [mainPos: int of X] [altPos: int of Y]                      
# VAR third Parameter [debugPara: true]  can be performance heavy 
func getEntByPos_quack(mainPos,altPos:int=0,debugPara=false):
	var vec          = checkForVector(mainPos,altPos)
	var validVec     = stopAtDefaultTilemapSize(vec)
	
	for currentEnt in entsOnMap.values():
		if currentEnt.pos() == validVec: return currentEnt
	
	if debugPara: print("no ent in key "+str(validVec)+" in MeatInteractable")



# ----- SETTER --------------------------------------------------------------- ##

func drawCell_quack( textureID:String, mainPos, altPos=0 ):
	_drawCell( textureID, mainPos, altPos )



	
