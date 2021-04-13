extends Entity
class_name InteractEntity


#----- INITIALICE ------------------------------------------------------------##

var position: 				Vector2



#----- GETTER ----------------------------------------------------------------##

func staticTilesetNR() -> int: 		return getCompValue(C_7_TILE_STATIC_TILESET_NR.name_quack())
func matrixNoise()     -> int:		return getCompValue(C_5_ANY_MATRIX_NOISE.name_quack())
func description()     -> String:	return getCompValue(C_0_ANY_DESCRIPTION.name_quack())
func magicNoise()      -> int:		return getCompValue(C_4_ANY_MAGIC_NOISE.name_quack())
func isWalkable()      -> bool: 	return getCompValue(C_1_ANY_IS_WALKABLE.name_quack())
func textureID()       -> String:	return getCompValue(C_2_ANY_TEXTURE_ID.name_quack())
func tileName()        -> String:	return getCompValue(C_6_TILE_NAME.name_quack())
func layer()           -> String: 	return getCompValue(C_3_ANY_LAYER.name_quack())
func mouseHover_quack() -> String:  return textureID()
func pos()             -> Vector2:	return position
func posX()            -> int:		return int(position.x)
func posY()            -> int:		return int(position.y)

func typeToString(): return "INTERACT"

func setPos(pos:Vector2):
	position = pos

func type(): return ENUM.TYPES_ON_MAP.INTERACT
func isSignalInReach(signalSource:TileEntity,reach:int) -> bool:
	var posBool :bool = false
	
	if (signalSource.currentPosition.x + reach) - self.posX() >= 0: posBool = true
	elif (signalSource.currentPosition.y + reach) - self.posY() >= 0: posBool = true
	
	return true



func getNameForGroupEntry():
	if has(C_6_TILE_NAME.name_quack()):
		return getCompValue(C_6_TILE_NAME)
	else:
		return tileName()
