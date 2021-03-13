extends Entity
class_name ActorEntity


#----- INITIALICE ------------------------------------------------------------##

var position: Vector2
var conditionList = []


 
#----- SPECIFIC VARS ---------------------------------------------------------##

# ---- GENERALL ----
func pos(): return position()
func textureID()        -> String:	return getCompValue(C_2_ANY_TEXTURE_ID.name_quack())
func tileName()         -> String:	return getCompTempValue("role",C_6_TILE_NAME.name_quack())
func staticTilesetlNr() -> String:	return getCompValue(C_7_TILE_STATIC_TILESET_NR.name_quack())
func synonym()          -> String:	return getCompValue(C_47_ANY_SYNONYM.name_quack())
func position()         -> Vector2:	return position
func mouseHover_quack() -> String:  return synonym()

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
func type(): return ENUM.TYPES_ON_MAP.ACTOR
func changeHitpoints(modValue):     getComp(C_57_HITPOINTS.name_quack()).changeHitpoints(modValue)
func typeToString(): return "ACTOR"

func posX():
	return position.x
func posY():
	return position.y

func setPos(pos:Vector2):
	position = pos



