extends Node
#//CLASS May be used in an Controller to get its Entities 
class_name Group_Atlas


#----- INITIALICE ------------------------------------------------------------##

var entitiesInGroup = {}
var kitName


func _init(namePara:String) -> void:
	name = namePara
	DemokrECTS.groupManager.allGroups[namePara] = self



#----- GETTER ----------------------------------------------------------------##
	
func getEntrySetName(entType,ent):
	if entType == "DEFAULT":
		return ent.getComp(C_6_TILE_NAME.name_quack()).value
		
	if entType == "KITPART":
		return ent.name.value


# TODO name des gruppenentry nicht ID sondern universal name
func has(ent):
	entitiesInGroup.has(ent )



#----- SETTER ----------------------------------------------------------------##


func addEntity(ent,entryName):
	if not has(ent):
		
		for i in DemokrECTS.getCoreType().size():
			if ent.hasFlag(DemokrECTS.getCoreType()[i]):
				ent = DemokrECTS.convertToEntity(ent)
		
		return ent


func removeEntity(ent):
	if has(ent):
		entitiesInGroup.remove( ent)






func convertToSpecificEntity(ent:Entity):
	var catType = ent.getComp(C_31_KIT_CAT_TYPE.name_quack())
	var partType = ent.getComp(C_38_KIT_PART_TYPE.name_quack())
	var currentEnt
	match partType.value:
		"BASE":
			currentEnt = BaseKitPartEntity.new(ent)
		"MOD":
			currentEnt = ModKitPartEntity.new(ent)
		"APPENDIX":
			currentEnt = AppendixKitPartEntity.new(ent)
		
	return currentEnt




