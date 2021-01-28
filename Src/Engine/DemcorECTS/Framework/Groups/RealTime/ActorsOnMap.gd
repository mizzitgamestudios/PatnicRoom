extends Group
class_name Group_ActorsOnMap

var entitiesInGroup = {}
func _init(namePara:String) -> void:
	name = namePara


func addEntity(ent:Entity) -> void:
	entitiesInGroup[_getEntName(ent)] = ent

func removeEntity(ent:Entity):
	if has(ent):
		entitiesInGroup.remove( _getEntName(ent) )

func has(ent:Entity):
	entitiesInGroup.has(_getEntName(ent))


func _getEntName(ent:Entity) -> int:
	return ent.getComponent("Comp_Universal_Name").value





