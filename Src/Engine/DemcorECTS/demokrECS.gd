###############################################################################################################################
#                                                                                                                             #
# Klasse:		--- DemokrECTS ---                                                                                            #
# description:	increases Framerate and empties unused but reserved memory space                                              #
#                                                                                                                             #
# data flow:	SokraTiles -> PanicMode -> Actor Layor                                                                        #
# often called:	N/A                                                                                                           #
#                                                                                                                             #
###############################################################################################################################

extends Node

##############################################################################
##  --- Parts of Engine ---                                                 ##
##############################################################################

var entityManager : EntityManager
var systemManager :SystemManager
var componentManager : ComponentManager
var groupManager : GroupManager
var performanceManager : PerformanceManager
var componentIndex : DemocrECTS_ComponentIndex
var tileEntManager : TileEntManager



func _init() -> void:
	tileEntManager= TileEntManager.new()
	systemManager = SystemManager.new()
	componentIndex = DemocrECTS_ComponentIndex.new()
	componentManager = ComponentManager.new()
	groupManager = GroupManager.new()
	performanceManager = PerformanceManager.new()
	entityManager = EntityManager.new()


################################################################################
##  --- TileEntity ---                                                        ##
################################################################################

func getActorByInstanceID(instanceID:String) -> TileEntity:
	return null

func setTile(tile:TileEntity,pos:Vector2):
	pass



func hasPosComponent(pos:Vector2,componentName:String) -> bool:
	return false



################################################################################
##  --- Component ---                                                         ##
################################################################################

func addCompToTile(tile:TileEntity,componentName:String) -> void:
	pass

func removeCompOfTile(tile:TileEntity,componentName:String) -> void:
	pass

func saveChunkAsJSON() -> void:
	pass

