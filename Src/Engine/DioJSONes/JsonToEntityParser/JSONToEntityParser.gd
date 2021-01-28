extends Node
class_name JsonToEntityParser

################################################################################
##  --- Actors ---                                                            ##
################################################################################

func parse(dictionary : Dictionary) -> Entity:
	var ent : Entity = Entity.new()
	
	for idx in dictionary:
		var compConstructor = Component.new()
		var dicToBuildComp
		
		
		var typeOfEntry : String = dictionary[idx].type
		var currentDicEntry : Dictionary = dictionary[idx]
		
		match typeOfEntry:
			ENUM.JSON_KEY_TYPE.ENTRY_SIMPLE:
				dicToBuildComp = currentDicEntry["value"]
				buildSimpleAndContainer(idx, dicToBuildComp, ent)
			
			ENUM.JSON_KEY_TYPE.ENTRY_CONTAINER:
				dicToBuildComp = self._recursiveSelfCall(currentDicEntry["value"])
				buildSimpleAndContainer(idx, dicToBuildComp, ent)
			
			ENUM.JSON_KEY_TYPE.TEMPLATE:
				buildTemplate(currentDicEntry, ent)
				
			ENUM.JSON_KEY_TYPE.ENTRY_DICTIONARY:
				buildArrayAndDictionary(idx,currentDicEntry, ent)
				
			ENUM.JSON_KEY_TYPE.ENTRY_ARRAY:
				buildArrayAndDictionary(idx,currentDicEntry, ent)
				
			ENUM.JSON_KEY_TYPE.META:
				buildMeta(idx,currentDicEntry, ent)
	return ent



################################################################################
##  --- Actors ---                                                            ##
################################################################################

# --- Basic --- #
func buildSimpleAndContainer(idx, dicToBuildComp, ent):
	var compConstructor = DioJSONes_SubParser_ComponentConstructor.new(idx, dicToBuildComp)
	var component = compConstructor.run()
	ent.add_component(component)

func buildArrayAndDictionary(idx,currentDicEntry, ent):
	var dicToBuildComp = currentDicEntry.value
	var compConstructor = DioJSONes_SubParser_ComponentConstructor.new(idx, dicToBuildComp)
	var component = compConstructor.run()
	ent.add_component(component)


# --- Advanced Parsere --- #
func buildMeta(idx,currentDicEntry, ent):
	var group = currentDicEntry["Group"]
	DemokrECTS.groupManager.allGroups[group].addEntity(ent)
	
func buildTemplate(currentDicEntry, ent):
	var arrOfFilePaths = getArrayOfFilePathsParts(currentDicEntry)
	
	var templateName = ArrayOfFilePathsToString(arrOfFilePaths)
	var dict = DioJSONes.parseFromArray(arrOfFilePaths)
	
	var template = self._recursiveSelfCall(dict)
	ent.addTemplate(templateName,template[0])

func _recursiveSelfCall(dic) -> Array:
	var tmpEnt : Array = []
	
	if(typeof(dic) == TYPE_ARRAY):
		for arrayItem in dic:
			tmpEnt.append(self.getEntityOfRecursion(arrayItem))
	else:
		tmpEnt.append(self.getEntityOfRecursion(dic))
	return tmpEnt



################################################################################
##  --- GETTER ---                                                            ##
################################################################################

func getEntityOfRecursion(dicOfComp : Dictionary) -> Entity:
	var tmpEnt : Entity = self.parse(dicOfComp)
	return tmpEnt

func getArrayOfFilePathsParts(currentDicEntry):
	return [currentDicEntry.group, currentDicEntry.sup, currentDicEntry.value]

func ArrayOfFilePathsToString(arrOfFilePaths):
	return PoolStringArray(arrOfFilePaths).join(ENUM.ECTS_GROUP_DELIMETER)

