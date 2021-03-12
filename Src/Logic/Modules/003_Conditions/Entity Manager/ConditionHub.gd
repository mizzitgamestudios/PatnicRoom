extends Node
class_name _003_ConditionManager


func construct(ent:Entity, condName:String, duration:int,intensity=0) -> void:
	var allConditions = API_003_Condition.getAllConditions()
	var cache = allConditions[condName].new(duration,intensity)
	cache.attachToEnt(ent,condName)



