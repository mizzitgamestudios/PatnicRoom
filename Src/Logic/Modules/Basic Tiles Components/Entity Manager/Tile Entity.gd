extends Entity
class_name TileEntity

################################################################################
##  --- Variables ---                                                         ##
################################################################################

var staticTilesetCellNr:Component
var layer:Component
var isWalkable:Component
var textureID:Component
var tileName:Component
var description:Component
var magicNoise:Component
var matrixNoise:Component
var uniqueComponents : Entity
var dictForDeepCopy = {}
var currentPosition: Vector2 = Vector2(9999,9999)

signal TileEntity_Validate_Use
signal TileEntity_Validate_Use_With_Comp



################################################################################
##  --- Functions ---                                                         ##
################################################################################
func deepCopy():
	if !dictForDeepCopy.has("Comp_Tile_Name"):
		buildDictForDeepCopy()
	
	return DemokrECTS.tileEntManager.constructEnt(dictForDeepCopy)


func buildDictForDeepCopy():
	dictForDeepCopy["Comp_Tile_Layer"] = layer()
	dictForDeepCopy["Comp_Tile_IsWalkable"] = isWalkable()
	dictForDeepCopy["Comp_Tile_Name"] = tileName()
	dictForDeepCopy["Comp_Tile_Description"] = description()
	dictForDeepCopy["Comp_Tile_MagicNoise"] = magicNoise()
	dictForDeepCopy["Comp_Tile_MatrixNoise"] = matrixNoise()
	dictForDeepCopy["Comp_Tile_TextureID"]= textureID()



################################################################################
##  --- Signals ---                                                           ##
################################################################################
func _on_TileEntity_looks_for_comp(emitPos:Vector2,reach:int,compName:String):
	var nameBool :bool = false
	if self.hasComponent(compName):
		nameBool = true

	var posBool :bool = false
	if (emitPos.x + reach) - self.currentPosition.x >= 0:
		posBool = true
	elif (emitPos.y + reach) - self.currentPosition.y >= 0:
		posBool = true

	return nameBool and posBool

func _on_TileEntity_Validate_Use(emitPos:Vector2,reach:int,tileName:String):
	var nameBool :bool = false 
	if self.textureID() == tileName:
		nameBool = true
		
	var posBool :bool = false
	if (emitPos.x + reach) - self.currentPosition.x >= 0:
		posBool = true
	elif (emitPos.y + reach) - self.currentPosition.y >= 0:
		posBool = true
	
	return nameBool and posBool

func _on_TileEntity_Validate_Use_With_Comp(signalSource:TileEntity,reach:int,tileName:String,componentName:String):
	var useBool :bool = _on_TileEntity_Validate_Use(signalSource.currentPosition,reach,tileName)
	
	var componentBool :bool = false
	if uniqueComponents.hasComponent(componentName):
		componentBool = true
	
	return useBool and componentBool

################################################################################
##  --- Getter ---                                                            ##
################################################################################

func staticTilesetCellNr() -> int:
	return staticTilesetCellNr.value

func layer() -> String:
	return layer.value

func isWalkable() -> bool:
	return isWalkable.value

func textureID() -> String:
	return textureID.value

func tileName() -> String:
	return tileName.value

func description() -> String:
	return description.value

func magicNoise() -> int:
	return magicNoise.value

func matrixNoise() -> int:
	return matrixNoise.value

func getUniqueComponents() -> Entity:
	return uniqueComponents

func isSignalInReach(signalSource:TileEntity,reach:int) -> bool:
	var posBool :bool = false
	if (signalSource.currentPosition.x + reach) - self.currentPosition.x >= 0:
		posBool = true
	elif (signalSource.currentPosition.y + reach) - self.currentPosition.y >= 0:
		posBool = true
	return true
	


