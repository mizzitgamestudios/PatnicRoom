extends SokraTiles_Chunk_Floor
class_name SokraTiles_Chunk_Meat_Floor


# ----- INITIALICE ----------------------------------------------------------- ##

func _ready() -> void:
	.initialice(ENUM.SOKRATILES_LAYER.MEAT_GROUND,self)

 

# ----- GETTER --------------------------------------------------------------- ##

# FUNC | OVERLOADED |                                           
# VAR [mainPos: Vector2] [altPos: default]                      
# VAR [mainPos: int of X] [altPos: int of Y] 
func getEntByPos_quack(mainPos,altPos:int=0,debugPara=false):
	var vec          = checkForVector(mainPos,altPos)
	var validVec     = stopAtDefaultTilemapSize(vec)
	var entity       = instance_from_id(entsOnMap[validVec])

	if is_instance_valid(entity): return entity
	elif debugPara: return print("no ent in key "+str(validVec)+" in MeatInteractable")



# ----- SETTER --------------------------------------------------------------- ##

func drawCell_quack( textureID:String, mainPos, altPos=0 ):
	_drawCell( textureID,mainPos,altPos )
