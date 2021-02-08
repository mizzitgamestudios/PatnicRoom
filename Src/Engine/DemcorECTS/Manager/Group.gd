###############################################################################################################################
#                                                                                                                             #
# Klasse:		GroupAtlas                                                                                                    #
# description:	Dictionary of all groups in ECTS                                                                              #
#                                                                                                                             #
# data flow:	                                                                                                              #
# often called:	N/A                                                                                                           #
#                                                                                                                             #
###############################################################################################################################

extends Node
class_name Group_Atlas


########################
# --- Init ----------- #
########################
var entitiesInGroup = {}
var kitName
func _init(namePara:String) -> void:
	name = namePara
	var cache = namePara.split("atlas_")
	DemokrECTS.groupManager.allGroups[namePara] = self

########################
# --- Helper --------- #
########################
func addEntity(ent:Entity) -> void:
	if not has(ent):

		if ent.hasComponent("Comp_KitPart_PartType"):
			ent = convertToSpecificEntity(ent)
			DemocrECTS.groupManager.atlas_All_Kit_Parts[ent.name.value] = ent 
		
		entitiesInGroup[_getEntName(ent)] = ent

func removeEntity(ent:Entity):
	if has(ent):
		entitiesInGroup.remove( _getEntName(ent) )

func has(ent:Entity):
	entitiesInGroup.has(_getEntName(ent))

func _getEntName(ent:Entity) -> String:
	var comp:Component = ent.getComponent("Comp_Universal_Name")
	return comp.getString()



func convertToSpecificEntity(ent:Entity):
	var catType = ent.getComponent("Comp_KitPart_CatType")
	var partType = ent.getComponent("Comp_KitPart_PartType")
	var currentEnt
	match partType:
		"BASE":
			currentEnt = BaseKitPartEntity.new()
		"MOD":
			currentEnt = BaseKitPartEntity.new()
		"APPENDIX":
			currentEnt = BaseKitPartEntity.new()
		
	return currentEnt








