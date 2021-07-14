extends Node
class_name Statistics_effectsSyntax_JSON



static func calcStats():
	var cache = _Syntax_Effect_Condition.new()
	
	var toJson      = {}
	var dynamicDocs = []
	
	
	dynamicDocs    += SYNTAX.EFFECT().TRIGGER.SPECIFIC.values()
	dynamicDocs    += SYNTAX.EFFECT().SPACE.SOURCE.values()
	dynamicDocs    += SYNTAX.EFFECT().SPACE.SOURCE.values()
	dynamicDocs    += SYNTAX.EFFECT().SPACE.MEDIUM.values()
	
	dynamicDocs    += _Syntax_Effect_Statmod.EFFECT_UNIQUE_STATMOD.values()
	dynamicDocs    += cache.EFFECT_CONDITION.values()
	
	
	for entry in dynamicDocs:
		var doc = entry.getDoc()
		toJson[doc["keyword"]] = doc
	

	for doc in getMType():          toJson[doc["keyword"]] = doc
	for doc in getTriggerBasic():   toJson[doc["keyword"]] = doc
	
	
	
	var file = File.new()
	var compDocToJson = JSON.print(toJson,"\t")
	
	file.open("res://tools/Statistics/output/Syntax Components.json",File.WRITE)
	file.store_line(compDocToJson)
	file.close()




static func getMType():
	return [
		{
		"keyword": "MEAT",
		"name": "Meat",
		"unit": "SPACE",
		"stat": "M_TYPE",
		"toString": "Meat",
		"inputModule": "VOID"
		},
		{
		"keyword": "MAGIC",
		"name": "Magic",
		"unit": "SPACE",
		"stat": "M_TYPE",
		"toString": "Magic",
		"inputModule": "VOID"
		},
		{
		"keyword": "MATRIX",
		"name": "Matrix",
		"unit": "SPACE",
		"stat": "M_TYPE",
		"toString": "Matrix",
		"inputModule": "VOID"
		}
	]


static func getTriggerBasic():
	return [
		{
		"keyword": "TILE",
		"name": "TILE",
		"unit": "TRIGGER",
		"stat": "BASIC",
		"toString": "Ground",
		"inputModule": "VOID"
		},
		{
		"keyword": "ACTOR",
		"name": "ACTOR",
		"unit": "TRIGGER",
		"stat": "BASIC",
		"toString": "Actors",
		"inputModule": "VOID"
		},
		{
		"keyword": "INTERACT",
		"name": "INTERACT",
		"unit": "TRIGGER",
		"stat": "BASIC",
		"toString": "Interactables",
		"inputModule": "VOID"
		},
		{
		"keyword": "ALL",
		"name": "ALL",
		"unit": "TRIGGER",
		"stat": "BASIC",
		"toString": "Interactables and Ground and Actors",
		"inputModule": "VOID"
		},
		{
		"keyword": "INTERACT_ACTOR",
		"name": "INTERACT_ACTOR",
		"unit": "TRIGGER",
		"stat": "BASIC",
		"toString": "Interactables and Actors",
		"inputModule": "VOID"
		},
				{
		"keyword": "INTERACT_TILE",
		"name": "INTERACT_TILE",
		"unit": "TRIGGER",
		"stat": "BASIC",
		"toString": "Interactables and Ground",
		"inputModule": "VOID"
		},
				{
		"keyword": "TILE_ACTOR",
		"name": "TILE_ACTOR",
		"unit": "TRIGGER",
		"stat": "BASIC",
		"toString": "Actors and Ground",
		"inputModule": "VOID"
		},
	]







