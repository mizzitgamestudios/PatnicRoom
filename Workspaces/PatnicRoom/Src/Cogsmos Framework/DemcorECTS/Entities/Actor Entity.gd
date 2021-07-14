
# CLASS                                                                              
# DOCS  https://mizzitgamestudios.github.io/mkDocs/site/Entities/actor/              
# CLASS                                                                              
# BOOKMARK[epic=Entities_Core] Actor                                                 
extends Entity
class_name ActorEntity


# ----- INITIALICE ----------------------------------------------------------- ##


var position: Vector2
var conditionList = []
var rngTemplate: ActorRNGTemplate



# ----- COMMON VARS ---------------------------------------------------------- ##


# VAR GENERALL              
func textureID()        -> String:	return getCompValue(C_2_ANY_TEXTURE_ID.name_quack())
func tileName()         -> String:	return getCompTempValue("role",C_6_TILE_NAME.name_quack())
func staticTilesetlNr() -> String:	return getCompValue(C_7_TILE_STATIC_TILESET_NR.name_quack())
func synonym()          -> String:	return getCompValue(C_47_ANY_SYNONYM.name_quack())
func mouseHover_quack() -> String:  return synonym()

func type()             -> String:  return ENUM.SOKRATILES.TYPES_ON_MAP.ACTOR
func typeToString()     -> String:  return ENUM.SOKRATILES.TYPES_ON_MAP.ACTOR

func position()         -> Vector2:	return position
func pos()				-> Vector2: return position()
func posX()             -> int:     return int(position.x)
func posY()             -> int:     return int(position.y)

# VAR ATTRIBUTES           
func constitution()     -> int:		return getCompValue(C_19_ACTOR_ATTRIBUTES.name_quack()).constitution.value
func agillity()         -> int:		return getCompValue(C_19_ACTOR_ATTRIBUTES.name_quack()).agillity.value
func reaction()         -> int:		return getCompValue(C_19_ACTOR_ATTRIBUTES.name_quack()).reaction.value
func willpower()        -> int:		return getCompValue(C_19_ACTOR_ATTRIBUTES.name_quack()).willpower.value
	
func strength()         -> int:		return getCompValue(C_19_ACTOR_ATTRIBUTES.name_quack()).strength.value
func intuition()        -> int:		return getCompValue(C_19_ACTOR_ATTRIBUTES.name_quack()).intuition.value
func charisma()         -> int:		return getCompValue(C_19_ACTOR_ATTRIBUTES.name_quack()).charisma.value
func logic()            -> int:		return getCompValue(C_19_ACTOR_ATTRIBUTES.name_quack()).logic.value

# VAR INDIRECT / CLACULATED 
func carriageCapacity() -> int:		return getCompValue(C_26_ACTOR_INDIRECT_STATS.name_quack()).carriageCapacity
func physicalLimit()    -> int:		return getCompValue(C_22_ACTOR_LIMITS.name_quack()).physicalLimit
func socialLimit()      -> int:		return getCompValue(C_22_ACTOR_LIMITS.name_quack()).socialLimit
func mentalLimit()      -> int:		return getCompValue(C_22_ACTOR_LIMITS.name_quack()).mentalLimit
func hitpoints()        -> int:		return getComp(C_57_HITPOINTS.name_quack()).value
func condition()        -> int:		return getCompValue(C_26_ACTOR_INDIRECT_STATS.name_quack()).condition





func changeHitpoints(modValue):     getComp(C_57_HITPOINTS.name_quack()).changeHitpoints(modValue)
func setPos(pos:Vector2):           position = pos



