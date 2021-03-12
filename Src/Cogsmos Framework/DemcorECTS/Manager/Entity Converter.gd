extends Object
class_name DemocrECTS_EntityConverter

var coreEntitiesToManage = [
	"F_1_STATIC_INTERACTABLE_TYPE",
	"F_2_TILE_TYPE",
	"F_5_KITPART_TYPE",
	"F_3_ITEM"
]

#FUNC can create an Entity by Dictionary or convert an Entity to a specific one 
#FUNC returns them as well                                                      
#VAR Usable for :                                                               
#VAR [F_1_STATIC_INTERACTABLE_TYPE] | [F_2_TILE_TYPE]                           
#VAR [F_5_KITPART_TYPE] | [F_3_ITEM]                                            
func addEntity(ent):
	if ent is Dictionary: return manageDictionary(ent)
	if ent is Entity: return manageEntity(ent)

		

func manageDictionary(ent):
	if ent is Dictionary:
		
		if ent.has("F_1_STATIC_INTERACTABLE_TYPE"): 	return API_015_StaticInteractable.contextualEntityGeneration_quack(ent)
		if ent.has("F_2_TILE_TYPE"): 					return API_000_BasicTilesAtlas.contextualEntityGeneration_quack(ent)
		if ent.has("F_5_KITPART_TYPE"): 				return API_006_KitParts.contextualEntityGeneration_quack(ent)
		# TODO: if ent.has("F_3_ITEM"): 						return 
		if ent.has("F_4_PLAYER_TYPE"): 					return API_000_BasicTilesAtlas.contextualEntityGeneration_quack(ent)
		if ent.has("F_4_PLAYER_TYPE"): 					return API_000_BasicTilesAtlas.contextualEntityGeneration_quack(ent)
		
	else:
		print(ent+" is not a Dictionary in EntityConverter")
		return ent


	
func manageEntity(ent):
	if ent is Entity:

		if ent.hasFlag("F_1_STATIC_INTERACTABLE_TYPE"): 	return API_015_StaticInteractable.convertEnt_quack(ent)
		if ent.hasFlag("F_2_TILE_TYPE"): 					return API_000_BasicTilesAtlas.contextualEntityGeneration_quack(ent)
		if ent.hasFlag("F_5_KITPART_TYPE"): 				return API_006_KitParts.contextualEntityGeneration_quack(ent)
		# TODO: if ent.hasFlag("F_3_ITEM"): 					return 
		if ent.hasFlag("F_4_PLAYER_TYPE"): 					return API_000_BasicTilesAtlas.createEntity_quack(ent)
		if ent.hasFlag("F_6_ACTOR_ATTRIBUTES"):				return API_001_MetahumanStats.contextualEntityGeneration_quack(ent)
		
	else:
		print(ent+" is not an Entity in EntityConverter")
		return ent




		








