<<<<<<< HEAD

# CLASS                                                                              
# DOCS  https://mizzitgamestudios.github.io/mkDocs/site/Cogsmos/democrECS/           
# CLASS                                                                              
# BOOKMARK[epic=Cogsmos Framework] DemocrECTS                                        
extends Node



# VAR all Entities in Game                                               
var atlas_entities = {}

# VAR All Component classes in game                                      
var atlas_known_components = []

# VAR Lists of diffrent (high level) kinds of Entities, used for Indexing 
var coreEntitiesToManage = [
	"F_1_INTERACTABLE_TYPE",
=======
extends Node
# CLASS Entiity    : Composed Object with unique Identifier          
# CLASS Component  : Datacontainer, slaved by Entities               
# CLASS Template   : Shared Entities, referenced by value            
# CLASS System     : Blackboxes,Computing Logic                      

# VAR all Entities in Game                                               
var atlas_entities = {}
# VAR All Component classes in game                                      
var atlas_known_components = []
# VAR Lists of diffrent (high level) kinds of Entities, used for Indexing 
var coreEntitiesToManage = [
	"F_1_STATIC_INTERACTABLE_TYPE",
>>>>>>> 14ed4bc523602584d0fecdfce3fc61f9ee8a2684
	"F_2_TILE_TYPE",
	"F_5_KITPART_TYPE",
	"F_3_ITEM"
]


var _entityConverter

<<<<<<< HEAD
# FUNC used by JsonToEntityParser of DioJSONes to Manage its Constructor
func initialiceNewEntry(ent_or_dict):  return _entityConverter.addEntity(ent_or_dict)

=======

func initialiceNewEntry(ent_or_dict):  return _entityConverter.addEntity(ent_or_dict)
>>>>>>> 14ed4bc523602584d0fecdfce3fc61f9ee8a2684
func getCoreType():                    return coreEntitiesToManage
