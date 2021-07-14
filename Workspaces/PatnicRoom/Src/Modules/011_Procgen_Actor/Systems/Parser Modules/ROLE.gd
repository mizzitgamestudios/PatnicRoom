extends Node
class_name _ROLE


static func run(value):
	match value.keys()[0]:
		"INDEX"                 : return getIndex(value["INDEX"])
		"FOCUSED_M_TYPE"        : return getMType(value["FOCUSED_M_TYPE"])
		"PREFERD_CHUNK_KEYWORD" : pass
	
	
	




static func getMType(arrOfMType):
	var arrToReturn = []
	var cachedAtlas = API_001_Atlas.RoleAtlas()
	
	for atlasEntry in cachedAtlas.values():
		for entry in arrOfMType:
			if entry == atlasEntry.getCompValue("C_37_ANY_M_TYPE"): 
				arrToReturn.append(atlasEntry)
	 
	return arrToReturn




static func getIndex(arrOfIndex):
	var arrToReturn = []
	
	for indexName in arrOfIndex:
		var cache = API_001_Atlas.Role().getTileByTextureID(indexName)
		arrToReturn.append(cache)
	
	return arrToReturn


