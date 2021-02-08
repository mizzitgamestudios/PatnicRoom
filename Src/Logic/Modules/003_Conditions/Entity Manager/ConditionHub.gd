extends Node
class_name _01_01_ConditionManager


func construct(ent:Entity, condName:String, duration:int, var intensity:int=0) -> void:
	var allConditions = _01_01_CompIndex.getIndex()
	allConditions[condName].new(ent,duration,intensity)



