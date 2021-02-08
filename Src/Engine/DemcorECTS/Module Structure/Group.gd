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

var effectGenerator = Effect_Generator_Simpel.new()
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
	if isKitPart(ent):
		generateKitPart(ent)
		
	else:
		entitiesInGroup[_getEntName(ent)] = ent


func removeEntity(ent:Entity):
	if has(ent):
		entitiesInGroup.remove( _getEntName(ent) )

func has(ent:Entity):
	entitiesInGroup.has(_getEntName(ent))

func _getEntName(ent:Entity) -> String:
	var comp:Component = ent.getComponent("Comp_Universal_Name")
	return comp.getString()

func addKitPartEntity(ent:Entity):
	var catType = ent.getComponent("Comp_KitPart_CatType").value
	var partType = ent.getComponent("Comp_KitPart_PartType").value
	var currentEnt
	match partType:
		"BASE":
			currentEnt = BaseKitPartEntity.new(ent)
		"MOD":
			currentEnt = BaseKitPartEntity.new(ent)
		"APPENDIX":
			currentEnt = BaseKitPartEntity.new(ent)
	return currentEnt

func isKitPart(ent:Entity):
	return ent.hasComponent("Comp_KitPart_PartType")



func generateKitPart(ent):
	var kitPartEnt:KitPartEntity = addKitPartEntity(ent)
	entitiesInGroup[kitPartEnt.name.value] = kitPartEnt
	kitPartEnt.effect  = effectGenerator.buildEffectProcess(kitPartEnt.effectReference.value)
	
	
	
	DemokrECTS.groupManager.atlas_All_Kit_Parts[kitPartEnt.name.value] = kitPartEnt

