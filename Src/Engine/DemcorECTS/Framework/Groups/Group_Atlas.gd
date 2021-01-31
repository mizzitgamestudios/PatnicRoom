###############################################################################################################################
#                                                                                                                             #
# Klasse:		GroupAtlas                                                                                                    #
# description:	Dictionary of all groups in ECTS                                                                              #
#                                                                                                                             #
# data flow:	                                                                                                              #
# often called:	N/A                                                                                                           #
#                                                                                                                             #
###############################################################################################################################

extends Group
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
		entitiesInGroup[_getEntName(ent)] = ent

func removeEntity(ent:Entity):
	if has(ent):
		entitiesInGroup.remove( _getEntName(ent) )

func has(ent:Entity):
	entitiesInGroup.has(_getEntName(ent))

func _getEntName(ent:Entity) -> String:
	var comp:Component = ent.getComponent("Comp_Universal_Name")
	return comp.getString()

func addMod(ent:Entity):
	if entitiesInGroup.has(ent.getComponent("requiredKit")):
		entitiesInGroup[ent.getComponent("")]
