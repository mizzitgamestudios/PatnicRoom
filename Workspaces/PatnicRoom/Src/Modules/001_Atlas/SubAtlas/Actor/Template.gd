extends Node
class_name _17_Actor_Template


var atlas_Entry = {}



func has(indexName)                 :   return atlas_Entry.has(indexName)
func getEntryByIndexName(indexName) :   return getTileByTextureID(indexName)



func getEntitiesWithCompValue(searchedTerm,componentClass):pass
func getEntitiesWithComp(componentClass):pass



func getTileByTextureID(indexName:String): 
	if has(indexName) : return atlas_Entry[indexName]
	else              : return "N/A"

func addEntity(ent:ActorRNGTemplate):
	atlas_Entry[ent.name] = ent
