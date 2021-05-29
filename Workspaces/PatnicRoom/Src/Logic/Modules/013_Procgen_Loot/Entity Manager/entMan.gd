extends DemocrECTS_EntityManager
class_name _18_TileEntManager


# ----- INITIALICE ----------------------------------------------------------- ##

var tileEntityIndex = C_2_ANY_TEXTURE_ID.name_quack()

# FUNC Neccessary,provides parent with needed vars 
func _init(namePara,mandatoryComponents).(namePara,mandatoryComponents) -> void: pass



# ----- CREATION ------------------------------------------------------------- ##

# FUNC generates Entity by the ObjectType of Parameter                         
# FUNC if you want to Hardcode ObjectType use [secureEntityGeneration_quack()] 
func contextualEntityGeneration_quack(dict_or_ent):
	var newEnt = TileEntity.new()
	
	if   dict_or_ent is Dictionary : return ._constructEnt_quack(dict_or_ent,newEnt)
	elif dict_or_ent is Entity     : return ._convertEnt_quack(dict_or_ent,newEnt)
	elif dict_or_ent is TileEntity : return ._convertEnt_quack(dict_or_ent,newEnt)
	else:                            return TileEntity

		
		
# FUNC generates Entity by the ObjectType and second Parameter                 
# VAR possible Parameter:                                                      
# VAR ["dict"] for Dictionary                                                  
# VAR ["commonEnt] for Entity                                                  
# VAR ["specificEnt"] for Entity of Manager                                    
# FUNC if you want to dynamic ObjectType use [contextualEntityGeneration_quack()] 
func secureEntityGeneration_quack(dict_or_ent,modeOfGeneration:String):
	var newEnt = TileEntity.new()
	
	match modeOfGeneration:
		"dict":        return ._constructEnt_quack(dict_or_ent,newEnt)
		"commonEnt":   return ._convertEnt_quack(dict_or_ent,newEnt)
		"specificEnt": return ._convertEnt_quack(dict_or_ent,newEnt)
		_:             return TileEntity

	

# ----- GETTER --------------------------------------------------------------- ##


