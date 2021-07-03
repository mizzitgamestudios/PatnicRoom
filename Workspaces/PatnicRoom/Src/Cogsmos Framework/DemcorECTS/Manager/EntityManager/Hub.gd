extends Object
class_name _DemocrECTS_EntityConverter



# BOOKMARK Entity-Constructor                                                    
var _interactableEntMan
var _tileEntMan
var _kitPartEntMan
var _actorProcGen

func _init():
<<<<<<< HEAD
	ENUM.PLAYER
	_interactableEntMan = _EntCon_Interactable.new( "_interactableEntMan" , ENUM.MINIMAL_COMP.INTERACT )
	_tileEntMan         = _EntCon_Tile.new(         "_tileEntMan"         , ENUM.MINIMAL_COMP.TILE     )
	_kitPartEntMan      = _EntCon_KitPart.new(      "_kitPartEntMan"      , ENUM.MINIMAL_COMP.KITPART  )
=======
	_interactableEntMan = _EntCon_Interactable.new( "_interactableEntMan" , ENUM.MINIMAL_COMP_INTERACT_ENT )
	_tileEntMan         = _EntCon_Tile.new(         "_tileEntMan"         , ENUM.MINIMAL_COMP_TILE_ENT     )
	_kitPartEntMan      = _EntCon_KitPart.new(      "_kitPartEntMan"      , ENUM.MINIMAL_COMP_KITPART_ENT  )
>>>>>>> 14ed4bc523602584d0fecdfce3fc61f9ee8a2684
	_actorProcGen       = _7_EntMan_Actor.new()



# FUNC can create an Entity by Dictionary or convert an Entity to a specific one        
# FUNC returns them as well                                                             
# VAR Usable for :                                                                      
<<<<<<< HEAD
# VAR [F_1_INTERACTABLE_TYPE] | [F_2_TILE_TYPE] | [F_5_KITPART_TYPE] | [F_3_ITEM]
func addEntity(ent_or_dict):
	if   hasFlag(ent_or_dict, "F_1_INTERACTABLE_TYPE")         : return createEntByType( ent_or_dict, InteractEntity.new() , _interactableEntMan )
	elif hasFlag(ent_or_dict, "F_2_TILE_TYPE")                 : return createEntByType( ent_or_dict, TileEntity.new()     , _tileEntMan         )
	elif hasFlag(ent_or_dict, "F_4_PLAYER_TYPE")               : return createEntByType( ent_or_dict, TileEntity.new()     , _tileEntMan         )
	elif hasFlag(ent_or_dict, "F_5_KITPART_TYPE")              : return createEntByType( ent_or_dict, KitPartEntity.new()  , _kitPartEntMan      )
	elif hasFlag(ent_or_dict, "F_6_ACTOR_ATTRIBUTES")          : return addActorAttributeByFlag(ent_or_dict)
# STUB 	if ent.hasFlag("F_3_ITEM"): 			        		return pass                        
	
	else:
		print(str(ent_or_dict) +" is not an Entity in EntityConverter")
=======
# VAR [F_1_STATIC_INTERACTABLE_TYPE] | [F_2_TILE_TYPE] | [F_5_KITPART_TYPE] | [F_3_ITEM]
func addEntity(ent_or_dict):
	if ent_or_dict is Entity or ent_or_dict is Dictionary :

		if hasFlag(ent_or_dict, "F_1_STATIC_INTERACTABLE_TYPE"): 	return contextualEntityGeneration_quack(ent_or_dict, InteractEntity.new() , _interactableEntMan )
		if hasFlag(ent_or_dict, "F_2_TILE_TYPE"): 					return contextualEntityGeneration_quack(ent_or_dict, TileEntity.new()     , _tileEntMan         )
		if hasFlag(ent_or_dict, "F_4_PLAYER_TYPE"): 				return contextualEntityGeneration_quack(ent_or_dict, TileEntity.new()     , _tileEntMan         )
		
		if hasFlag(ent_or_dict, "F_5_KITPART_TYPE"): 				return addKitPart(ent_or_dict)
		if hasFlag(ent_or_dict, "F_6_ACTOR_ATTRIBUTES"):			return addActorAttributeByFlag(ent_or_dict                                                      )

# STUB 	if ent.hasFlag("F_3_ITEM"): 			        		return pass                        
	
	
	else:
		print(ent_or_dict +" is not an Entity in EntityConverter")
>>>>>>> 14ed4bc523602584d0fecdfce3fc61f9ee8a2684
		return ent_or_dict



<<<<<<< HEAD
=======
func addKitPart(ent_or_dict):
	var kitPart = contextualEntityGeneration_quack(ent_or_dict, KitPartEntity.new(), _kitPartEntMan)
	API_001_Atlas._kitparts.addEntity(kitPart)
	return kitPart


func addActorAttributeByFlag(ent_or_dict:Entity):
	if ent_or_dict.hasFlag("F_10_ACTOR_ATTRIBUTES_ROLES")    : API_001_Atlas._role.addEntity(ent_or_dict)
	if ent_or_dict.hasFlag("F_11_ACTOR_ATTRIBUTES_RACE")     : API_001_Atlas._race.addEntity(ent_or_dict)
	if ent_or_dict.hasFlag("F_7_ACTOR_ATTRIBUTES_SPECIALTY") : API_001_Atlas._specialty.addEntity(ent_or_dict)
>>>>>>> 14ed4bc523602584d0fecdfce3fc61f9ee8a2684

func hasFlag(ent_or_dict,flagName):
	if ent_or_dict is Entity:     return ent_or_dict.hasFlag(flagName)
	if ent_or_dict is Dictionary: return ent_or_dict.has(flagName)


<<<<<<< HEAD
func createEntByType(dict_or_ent,newEnt,entMan):
	if   dict_or_ent is Dictionary : return entMan._constructEnt_quack(dict_or_ent,newEnt)
	elif dict_or_ent is Entity     : return entMan._convertEnt_quack(dict_or_ent,newEnt)
=======
func contextualEntityGeneration_quack(dict_or_ent,newEnt,entMan):
	if   dict_or_ent is Dictionary : return entMan._constructEnt_quack(dict_or_ent,newEnt)
	elif dict_or_ent is Entity     : return entMan._convertEnt_quack(dict_or_ent,newEnt)
	else:                            return null
>>>>>>> 14ed4bc523602584d0fecdfce3fc61f9ee8a2684




<<<<<<< HEAD

func addActorAttributeByFlag(ent:Entity):
	if ent.hasFlag("F_10_ACTOR_ATTRIBUTES_ROLES")    : API_001_Atlas._role.addEntity(ent)
	if ent.hasFlag("F_11_ACTOR_ATTRIBUTES_RACE")     : API_001_Atlas._race.addEntity(ent)
	if ent.hasFlag("F_7_ACTOR_ATTRIBUTES_SPECIALTY") : API_001_Atlas._specialty.addEntity(ent)
	
	if ent.hasFlag("F_14_NPC_TEMPLATE")              : API_001_Atlas._specialty.addEntity(ent)


=======
func secureEntityGeneration_quack(dict_or_ent,newEnt,entMan,modeOfGeneration:String):
	match modeOfGeneration:
		"dict":        return entMan._constructEnt_quack(dict_or_ent,newEnt)
		"commonEnt":   return entMan._convertEnt_quack(dict_or_ent,newEnt)
		"specificEnt": return entMan._convertEnt_quack(dict_or_ent,newEnt)
		_:             return null
>>>>>>> 14ed4bc523602584d0fecdfce3fc61f9ee8a2684
