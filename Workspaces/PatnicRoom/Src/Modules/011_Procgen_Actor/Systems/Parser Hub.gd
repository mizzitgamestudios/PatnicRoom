extends Object
class_name _011_Hub_Template



static func run(dict):   return ActorRNGTemplate.new( evaluateMandatory(dict), evaluateAdditional(dict) )


static func evaluateMandatory(dict):
	return{
		 "NAME"      : dict["NAME"]
		,"RACE"      : _RACE.run( dict["RACE"] )
		,"ROLE"      : _ROLE.run( dict["ROLE"] )
		,"SPECIALTY" : _SPECIALTY.run( dict["SPECIALTY"] )
	}


static func evaluateAdditional(dict):
	var cache = {}
	for keyword in dict:   match keyword: 
		"KITSETS"     :  cache["KITSETS"] = keyword
		"ITEMS"       :  cache["ITEMS"] = keyword
		"LOOT_TABLES" :  cache["LOOT_TABLES"] = keyword
		"TRAITS"      :  cache["TRAITS"] = keyword
	return cache
	




