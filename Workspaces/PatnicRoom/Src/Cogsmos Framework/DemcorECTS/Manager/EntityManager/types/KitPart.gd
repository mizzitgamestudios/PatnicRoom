extends DemocrECTS_EntityManager
class_name _EntCon_KitPart


# ----- INITIALICE ----------------------------------------------------------- ##


var kitpartEntityIndex = C_6_TILE_NAME.name_quack()

# FUNC Neccessary,provides parent with needed vars 
func _init(namePara,mandatoryComponents).(namePara,mandatoryComponents) -> void: pass


func _constructEnt_quack(dict,newEnt):
	var kitPart = self._constructEnt_quack(dict,newEnt)
	API_001_Atlas._kitparts.addEntity(kitPart)
	return kitPart

func _convertEnt_quack(dict,newEnt):
	var kitPart = self._copyEnt_quack(dict,newEnt)
	API_001_Atlas._kitparts.addEntity(kitPart)
	return kitPart



func convertToSpecificEntity(ent:KitPartEntity):
	var catType = ent.getComp(C_31_KIT_CAT_TYPE.name_quack())
	var partType = ent.getComp(C_38_KIT_PART_TYPE.name_quack())
	var currentEnt
	match partType.value:
		"BASE":
			currentEnt = BaseKitPartEntity.new(ent)
		"MOD":
			currentEnt = ModKitPartEntity.new(ent)
		"APPENDIX":
			currentEnt = AppendixKitPartEntity.new(ent)
		
	return currentEnt




