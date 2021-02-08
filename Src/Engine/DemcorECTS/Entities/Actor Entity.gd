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
class_name ActorEntity
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
var tileName: Component
var textureID: Component
var position: Component
var synonym: Component
var attributes: Component
var skills: Component
var indirectStats : Component

signal TileEntity_Validate_Use
signal TileEntity_Validate_Use_With_Comp




################################################################################
##  --- Signals ---                                                           ##
################################################################################
func _on_TileEntity_looks_for_comp(emit:TileEntity,reach:int,compName:String):
	return isSignalInReach(emit,reach) and self.hasComponent(compName)

func _on_TileEntity_Validate_Use(emit:TileEntity,reach:int,tileNamePara:String):	
	return isSignalInReach(emit,reach) and self.textureID() == tileNamePara

func _on_TileEntity_is_in_reach(emit:TileEntity,reach:int):	
	return isSignalInReach(emit,reach)

################################################################################
##  --- Getter ---                                                            ##
################################################################################

func tileName() -> int:
	return tileName.value

func textureID() -> String:
	return textureID.value

func staticTilesetCellNr() -> String:
	return tileName.value

func position() -> String:
	return position.value

func synonym() -> int:
	return synonym.value

func attributes() -> int:
	return attributes.value

func getPosX():
	return position.value.x
func getPosY():
	return position.value.y



func isSignalInReach(signalSource:TileEntity,reach:int) -> bool:
	var posBool :bool = false
	if (signalSource.currentPosition.x + reach) - self.currentPosition.x >= 0:
		posBool = true
	elif (signalSource.currentPosition.y + reach) - self.currentPosition.y >= 0:
		posBool = true
	return true
