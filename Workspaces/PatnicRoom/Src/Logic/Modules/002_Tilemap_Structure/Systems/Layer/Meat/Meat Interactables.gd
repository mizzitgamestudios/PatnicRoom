extends SokraTiles_Chunk_Interactables
class_name SokraTiles_Chunk_Meat_Interactables


# ----- INITIALICE ----------------------------------------------------------- ##

var uniqueEntsOnMap = {}
var wallsOnMap = {}
var doorsOnMap = {}

func _ready() -> void:
	.initialice(ENUM.SOKRATILES_LAYER.MEAT_INTERACTABLE,self)
	
	var entsToPars = entsOnMap.values()
	var posOfEnts = entsOnMap.keys()
	
	for i in entsToPars.size():
		
		var currentTile = instance_from_id(entsToPars[i])
		
		if   currentTile.hasFlag("F_8_IS_WALL"):  addTileToList(wallsOnMap, currentTile)
		elif currentTile.hasFlag("F_9_IS_DOOR"):  addTileToList(doorsOnMap, currentTile)
		else:                                     addTileToList(uniqueEntsOnMap,  currentTile)


func addTileToList(dict,currentTile):             dict[currentTile.pos()] = currentTile#.get_instance_id()



# ----- VALIDATORS ----------------------------------------------------------- ##

func isPosWall(pos:Vector2): return wallsOnMap.has(pos)
func isPosOpenDoor(pos:Vector2): 
	if doorsOnMap.has(pos): 
		var ent  = doorsOnMap[pos]
		var comp = ent.getCompValue("C_1_ANY_IS_WALKABLE")
		return doorsOnMap[pos].getCompValue("C_1_ANY_IS_WALKABLE")
	else: true

func isDoorClosed(pos:Vector2):
	if doorsOnMap[pos].getCompValue("C_1_ANY_IS_WALKABLE") == true: return false
	if doorsOnMap[pos].getCompValue("C_1_ANY_IS_WALKABLE") == false: return true
	
func isPosDoor(pos:Vector2):                        return doorsOnMap.has(pos)



# ----- GETTER --------------------------------------------------------------- ##

# FUNC | OVERLOADED |                                           
# VAR [mainPos: Vector2] [altPos: default]                      
# VAR [mainPos: int of X] [altPos: int of Y]                    
func getEntByPos_quack(mainPos,altPos:int=0,debugPara=false):
	var vec          = checkForVector(mainPos,altPos)
	var validVec     = stopAtDefaultTilemapSize(vec)
	# VAR saniticedVec = convertForPivot(ENUM.TYPES_ON_MAP.INTERACT,validVec)
	
	var entity                             = null
	if entsOnMap.has(validVec): entity = entsOnMap[validVec]
	if entity != null:              entity = instance_from_id(entity)
	return entity


# ----- SETTER --------------------------------------------------------------- ##

func drawCell_quack( textureID:String, mainPos, altPos=0 ):
	_drawCell( textureID,mainPos,altPos )





	
