###############################################################################################################################
#                                                                                                                             #
# Klasse:		ActorsOnMap                                                                                                   #
# description:	List of all Actors on @SokraTiles.Atlas_tileset_Meta on ActorLayor                                            #
#                                                                                                                             #
# data flow:	SokraTiles -> PanicMode -> Actor Layor                                                                        #
# often called:	N/A                                                                                                           #
#                                                                                                                             #
###############################################################################################################################

extends Group
class_name Group_ActorsOnMap



########################
# --- Init ----------- #
########################
var entitiesInGroup = {}
func _init(namePara:String) -> void:
	name = namePara



########################
#--- Helper ---------- #
########################
func addEntity(ent:Entity) -> void:
	entitiesInGroup[_getEntName(ent)] = ent

func removeEntity(ent:Entity):
	if has(ent):
		entitiesInGroup.remove( _getEntName(ent) )

func has(ent:Entity):
	entitiesInGroup.has(_getEntName(ent))


func _getEntName(ent:Entity) -> int:
	return ent.getComponent("Comp_Universal_Name").value





