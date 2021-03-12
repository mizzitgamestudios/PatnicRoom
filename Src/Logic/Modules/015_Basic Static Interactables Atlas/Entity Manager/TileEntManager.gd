extends DemocrECTS_EntityManager
class_name _15_StaticInterManager


#----- INITIALICE ------------------------------------------------------------##


var tileEntityIndex = C_2_ANY_TEXTURE_ID.name_quack()

func _init(namePara,mandatoryComponents).(namePara,mandatoryComponents) -> void:
	pass


#----- CREATION --------------------------------------------------------------##

func contextualEntityGeneration_quack(dict_or_ent):
	var newEnt = InteractEntity.new()
	
	if   dict_or_ent is Dictionary : return ._constructEnt_quack(dict_or_ent,newEnt)
	elif dict_or_ent is Entity     : return ._convertEnt_quack(dict_or_ent,newEnt)
	elif dict_or_ent is TileEntity : return ._convertEnt_quack(dict_or_ent,newEnt)
	else:                            return InteractEntity


func secureEntityGeneration_quack(dict_or_ent,modeOfGeneration:String):
	var newEnt = InteractEntity.new()
	
	match modeOfGeneration:
		"dict":        return ._constructEnt_quack(dict_or_ent,newEnt)
		"commonEnt":   return ._convertEnt_quack(dict_or_ent,newEnt)
		"specificEnt": return ._convertEnt_quack(dict_or_ent,newEnt)
		_:             return InteractEntity

	
	




#----- GETTER ----------------------------------------------------------------##

func getTilesWithComp(componentName:String, onlyMandatory:bool):
	return .getEntitiesWithComp(componentName,onlyMandatory)


func getTilesWithCompValue(componentName:String, value:String, onlyMandatory=false):
	return .getEntitiesWithCompValueOfString(componentName, value, onlyMandatory)


func getTileByTextureID(textureIDIndex:String):
	for i in .getKnownEntities().size():
		var currentEnt = .getKnownEntities()[i]
		
		if currentEnt.getCompValue(tileEntityIndex) == textureIDIndex:
			return getKnownEntities()[i]	
	
	return TileEntity

		

