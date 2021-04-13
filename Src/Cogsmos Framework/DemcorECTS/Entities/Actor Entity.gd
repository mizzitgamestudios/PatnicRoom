extends Entity
class_name ActorEntity


#----- INITIALICE ------------------------------------------------------------##

var position: Vector2
var conditionList = []
export var health:int  = 0

func _ready() -> void:
	health = getComp(C_57_HITPOINTS.name_quack()).value
 
#----- SPECIFIC VARS ---------------------------------------------------------##

# ---- GENERALL ----
func textureID()        -> String:	return getCompValue(C_2_ANY_TEXTURE_ID.name_quack())
func tileName()         -> String:	return getCompTempValue("role",C_6_TILE_NAME.name_quack())
func staticTilesetlNr() -> String:	return getCompValue(C_7_TILE_STATIC_TILESET_NR.name_quack())
func synonym()          -> String:	return getCompValue(C_47_ANY_SYNONYM.name_quack())
func mouseHover_quack() -> String:  return synonym()

func type()             -> String:  return ENUM.TYPES_ON_MAP.ACTOR
func typeToString()     -> String:  return "ACTOR"

func position()         -> Vector2:	return position
func pos()				-> Vector2: return position()
func posX()             -> int:     return int(position.x)
func posY()             -> int:     return int(position.y)

# ---- ATTRIBUTES ----
func constitution()     -> int:		return getCompValue(C_19_ACTOR_ATTRIBUTES.name_quack()).constitution.value
func agillity()         -> int:		return getCompValue(C_19_ACTOR_ATTRIBUTES.name_quack()).agillity.value
func reaction()         -> int:		return getCompValue(C_19_ACTOR_ATTRIBUTES.name_quack()).reaction.value
func willpower()        -> int:		return getCompValue(C_19_ACTOR_ATTRIBUTES.name_quack()).willpower.value
	
func strength()         -> int:		return getCompValue(C_19_ACTOR_ATTRIBUTES.name_quack()).strength.value
func intuition()        -> int:		return getCompValue(C_19_ACTOR_ATTRIBUTES.name_quack()).intuition.value
func charisma()         -> int:		return getCompValue(C_19_ACTOR_ATTRIBUTES.name_quack()).charisma.value
func logic()            -> int:		return getCompValue(C_19_ACTOR_ATTRIBUTES.name_quack()).logic.value

# ---- INDIRECT ----
func carriageCapacity() -> int:		return getCompValue(C_26_ACTOR_INDIRECT_STATS.name_quack()).carriageCapacity
func physicalLimit()    -> int:		return getCompValue(C_22_ACTOR_LIMITS.name_quack()).physicalLimit
func socialLimit()      -> int:		return getCompValue(C_22_ACTOR_LIMITS.name_quack()).socialLimit
func mentalLimit()      -> int:		return getCompValue(C_22_ACTOR_LIMITS.name_quack()).mentalLimit
func hitpoints()        -> int:		return getComp(C_57_HITPOINTS.name_quack()).value
func condition()        -> int:		return getCompValue(C_26_ACTOR_INDIRECT_STATS.name_quack()).condition





func changeHitpoints(modValue):     getComp(C_57_HITPOINTS.name_quack()).changeHitpoints(modValue)
func setPos(pos:Vector2):           position = pos



