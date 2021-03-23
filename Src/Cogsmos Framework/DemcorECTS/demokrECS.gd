extends Node
#//CLASS Entiity    : Composed Object with unique Identifier          
#//CLASS Component  : Datacontainer, slaved by Entities               
#//CLASS Template   : Shared Entities, referenced by value            
#//CLASS System     : Blackboxes,Computing Logic                      

#VAR all Entities in Game                                               
var atlas_entities = {}
#VAR All Component classes in game                                      
var atlas_known_components = []
#VAR Lists of diffrent (high level) kinds of Entities, used for Indexing 


#VAR uses ducktyping to manage diffrent core-types of Entitities         
var entityConverter: DemocrECTS_EntityConverter


func convertToEntity(dict_ent):
	return entityConverter.addEntity(dict_ent)



func getCoreType():
	return entityConverter.coreEntitiesToManage
