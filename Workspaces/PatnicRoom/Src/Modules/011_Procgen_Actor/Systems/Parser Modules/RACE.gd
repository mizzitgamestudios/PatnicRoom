extends Node
class_name _RACE


static func run(value):
	match value.keys()[0]:
		"INDEX"                 : return getIndex(value["INDEX"])
		"PREFERD_CHUNK_KEYWORD" : pass






static func getIndex(arrOfIndex):
	var arrToReturn = []
	
	for indexName in arrOfIndex:
		var cache = API_001_Atlas.Race().getTileByTextureID(indexName)
		arrToReturn.append(cache)
	
	return arrToReturn







