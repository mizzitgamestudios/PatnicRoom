
# CLASS                                                                              
# DOCS  https://mizzitgamestudios.github.io/mkDocs/site/Entities/tile/               
# CLASS                                                                              
# BOOKMARK[epic=Entities_Core] Tile                                                  
extends Entity
class_name TileEntity


var uniqueComponents : Entity
var position : 		Vector2



# ----- COMMON VARS ---------------------------------------------------------- ##

# VAR GENERALL 
func staticTilesetNR() -> int: 		return getCompValue(C_7_TILE_STATIC_TILESET_NR.name_quack())
func description()     -> String:	return getCompValue(C_0_ANY_DESCRIPTION.name_quack())
func textureID()       -> String:	return getCompValue(C_2_ANY_TEXTURE_ID.name_quack())
func layer()           -> String: 	return getCompValue(C_3_ANY_LAYER.name_quack())
func tileName()        -> String:	return getCompValue(C_6_TILE_NAME.name_quack())

# VAR TYPE     
func typeToString()    -> String: 	return ENUM.SOKRATILES.TYPES_ON_MAP.TILE
func type()            -> String:	return ENUM.SOKRATILES.TYPES_ON_MAP.TILE
func isWalkable()      -> bool: 	return getCompValue(C_1_ANY_IS_WALKABLE.name_quack())
func mouseHover_quack() -> String:  return textureID()

# VAR POSITION 
func pos()             -> Vector2:	return position
func posX()            -> int:		return int(position.x)
func posY()            -> int:		return int(position.y)

# VAR ENV.    
func matrixNoise()     -> int:		return getCompValue(C_5_ANY_MATRIX_NOISE.name_quack())
func magicNoise()      -> int:		return getCompValue(C_4_ANY_MAGIC_NOISE.name_quack())



# ----- SETTER --------------------------------------------------------------- ##


func setPos(pos:Vector2): 	position = pos


	
