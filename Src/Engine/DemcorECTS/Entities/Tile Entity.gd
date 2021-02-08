###############################################################################################################################
#                                                                                                                             #
# Klasse:		TileE                                                                                                         #
# description:	Basic class for Tilemap representation,includes Signal for broadcasts                                         #
#               further Components are no lowest anominator and can be declared in uniqueComponents                           #
#                                                                                                                             #
# data flow:	                                                                                                              #
# often called:	N/A                                                                                                           #
#                                                                                                                             #
###############################################################################################################################

extends Entity
class_name TileEntity
################################################################################
##  --- Variables ---                                                         ##
##                                                                            ##
##      description          = toString() for looking action of player        ##
##      tileName             = Name of TileEntity,UID                         ##
##      Layer                = typicall movement                              ##
##                                                                            ##
##      isWalkable           = lets actors stay on tile                       ##
##      staticTilesetCellNr  = hardcoded Numbers in Media/Tilesets/all.tres   ##
##      textureID            = Name of TileEntity and its referenced          ##
##      currentPosition      = Vector2() about the whereabouts on map         ##
##                                                                            ##
##      magicNoise           =                                                ##
##      MatrixNoise          =                                                ##
##                                                                            ##
##      uniqueComponents     = Components which are special to TileEntity     ##
##      dictForDeepCopy      = dict for an reference copy of TileEntity       ##
##                                                                            ##
##                                                                            ##
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
#  --- Functions ---                                                         #
################################################################################
func deepCopy():
	if !dictForDeepCopy.has("Comp_Tile_Name"):
		buildDictForDeepCopy()
		
	return API_000_BasicTilesAtlas.createNewTileByDict(dictForDeepCopy)

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
func _on_TileEntity_looks_for_comp(emit:TileEntity,reach:int,compName:String):
	return isSignalInReach(emit,reach) and self.hasComponent(compName)

func _on_TileEntity_Validate_Use(emit:TileEntity,reach:int,tileNamePara:String):	
	return isSignalInReach(emit,reach) and self.textureID() == tileNamePara

func _on_TileEntity_Validate_Use_With_Comp(signalSource:TileEntity,reach:int,tileNamePara:String,componentName:String):
	return uniqueComponents.hasComponent(componentName) and _on_TileEntity_Validate_Use(signalSource,reach,tileNamePara)

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
	


