extends DemocrECTS_EntityManager
class_name _6_KitpartEntityManager


#----- INITIALICE ------------------------------------------------------------##


var kitpartEntityIndex = C_6_TILE_NAME.name_quack()

func _init(namePara,mandatoryComponents).(namePara,mandatoryComponents) -> void:
	pass


#----- CREATION --------------------------------------------------------------##

func contextualEntityGeneration_quack(dict_or_ent):
	var newEnt = KitPartEntity.new()
	
	if   dict_or_ent is Dictionary : return ._constructEnt_quack(dict_or_ent,newEnt)
	elif dict_or_ent is Entity     : return ._convertEnt_quack(dict_or_ent,newEnt)
	elif dict_or_ent is KitPartEntity : return ._convertEnt_quack(dict_or_ent,newEnt)
	else:                            return KitPartEntity


func secureEntityGeneration_quack(dict_or_ent,modeOfGeneration:String):
	var newEnt = KitPartEntity.new()
	
	match modeOfGeneration:
		"dict":        return ._constructEnt_quack(dict_or_ent,newEnt)
		"commonEnt":   return ._convertEnt_quack(dict_or_ent,newEnt)
		"specificEnt": return ._convertEnt_quack(dict_or_ent,newEnt)
		_:             return KitPartEntity

	

#----- GETTER ----------------------------------------------------------------##

func getKitPartsWithComp(componentName:String, onlyMandatory:bool):
	return .getEntitiesWithComp(componentName,onlyMandatory)


func getKitPartsWithCompValue(componentName:String, value:String, onlyMandatory=false):
	return .getEntitiesWithCompValueOfString(componentName, value, onlyMandatory)


func getKitPartByTextureID(textureIDIndex:String):
	for i in .getKnownEntities().size():
		var currentEnt = .getKnownEntities()[i]
		
		if currentEnt.getCompValue(kitpartEntityIndex) == textureIDIndex:
			return getKnownEntities()[i]	
	
	return KitPartEntity
	
	

	




