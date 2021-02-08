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
class_name InteractEntity




var staticTilesetCellNr:Component
var layer:Component
var tileName: Component
var position: Component
var textureID:Component

var uniqueComponents: Entity


signal TileEntity_Validate_Use
signal TileEntity_Validate_Use_With_Comp



################################################################################
#  --- Functions ---                                                         #
################################################################################



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

func staticTilesetCellNr():
	staticTilesetCellNr.value

func layer():
	return layer.value
	
func tileName():
	return tileName.value
	
func textureID():
    return textureID.value

func position():
    return position.value

    

func isSignalInReach(signalSource:TileEntity,reach:int) -> bool:
	var posBool :bool = false
	if (signalSource.currentPosition.x + reach) - self.currentPosition.x >= 0:
		posBool = true
	elif (signalSource.currentPosition.y + reach) - self.currentPosition.y >= 0:
		posBool = true
	return true
	

	

	

	
