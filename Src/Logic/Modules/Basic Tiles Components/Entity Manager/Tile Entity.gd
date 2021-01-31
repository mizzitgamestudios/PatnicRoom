###############################################################################################################################
#                                                                                                                             #
# Klasse:		TileEntity                                                                                                    #
# description:	Basic class for Tilemap representation,includes Signal for broadcasts                                         #
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
##      tileName             = Name of TileEnt,UID                            ##
##      Layer                = typicall movement                              ##
##                                                                            ##
##      isWalkable           = lets actors stay on tile                       ##
##      staticTilesetCellNr  = hardcoded Numbers in Media/Tilesets/all.tres   ##
##      textureID            = Name of TileEnt and its referenced             ##
##      currentPosition      = Vector2() about the whereabouts on map         ##
##                                                                            ##
##      magicNoise           =                                                ##
##      MatrixNoise          =                                                ##
##                                                                            ##
##      uniqueComponents     = Components which are special to TileEnt        ##
##      dictForDeepCopy      = dict for an reference copy of TileEnt          ##
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
func _on_TileEntity_looks_for_comp(emit:TileEntity,reach:int,compName:String):
	return isSignalInReach(emit,reach) and self.hasComponent(compName)

func _on_TileEntity_Validate_Use(emit:TileEntity,reach:int,tileName:String):	
	return isSignalInReach(emit,reach) and self.textureID() == tileName

func _on_TileEntity_Validate_Use_With_Comp(signalSource:TileEntity,reach:int,tileName:String,componentName:String):
	return uniqueComponents.hasComponent(componentName) and _on_TileEntity_Validate_Use(signalSource,reach,tileName)

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
	


