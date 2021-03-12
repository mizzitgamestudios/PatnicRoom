extends Node
class_name JsonToEntityParser
#//CLASS Hub for Interpreting JSON-Files of GameData :                 
#//CLASS every Dataset is wrapped as an Object with a String-key       
#//CLASS the String equals an entry of ENUM.JSON_KEY_TYPE              

func parse(dictionary : Dictionary) -> Entity:
	var ent : Entity = Entity.new()
	
	for idx in dictionary:
		var compConstructor = Component.new()
		var dicToBuildComp
		
		
		var typeOfEntry : String = dictionary[idx].type
		var currentDicEntry : Dictionary = dictionary[idx]
		
		#VAR Hub for Dataset to add to Entity  
		match typeOfEntry:
			ENUM.JSON_KEY_TYPE.ENTRY_SIMPLE:
				dicToBuildComp = currentDicEntry["value"]
				addAsSimpleComp(idx, dicToBuildComp, ent)
			
			ENUM.JSON_KEY_TYPE.ENTRY_CONTAINER:
				dicToBuildComp = self._recursiveSelfCall(currentDicEntry["value"])
				addAsSimpleComp(idx, dicToBuildComp, ent)
			
			ENUM.JSON_KEY_TYPE.TEMPLATE:
				addAsTemplate(currentDicEntry, ent)
				
			ENUM.JSON_KEY_TYPE.ENTRY_DICTIONARY:
				addAsArrOrDict(idx, currentDicEntry, ent)
				
			ENUM.JSON_KEY_TYPE.ENTRY_ARRAY:
				addAsArrOrDict(idx, currentDicEntry, ent)
				
			ENUM.JSON_KEY_TYPE.META:
				buildMeta(idx, currentDicEntry, ent)
			
			ENUM.JSON_KEY_TYPE.ENTRY_EFFECT:
				addAsEffect(idx, currentDicEntry, ent)
				
			ENUM.JSON_KEY_TYPE.FLAG:
				addAsFlag(idx, ent)
		
		
	return ent



# --- Basic --- #
func addAsSimpleComp(idx, dicToBuildComp, ent):
	var compConstructor = DioJSONes_SubParser_ComponentConstructor.new(idx, dicToBuildComp)
	var component = compConstructor.run()
	ent.addComponent(component)

func addAsArrOrDict(idx,currentDicEntry, ent):
	var dicToBuildComp = currentDicEntry.value
	var compConstructor = DioJSONes_SubParser_ComponentConstructor.new(idx, dicToBuildComp)
	var component = compConstructor.run()
	ent.addComponent(component)

func addAsEffect(idx,currentDicEntry, ent):
	var dicToBuildComp = currentDicEntry
	var compConstructor = DioJSONes_SubParser_ComponentConstructor.new(idx, dicToBuildComp)
	var component = compConstructor.run()
	ent.addComponent(component)


# --- Advanced Parsere --- #
func buildMeta(idx,currentDicEntry, ent):
	#var group = currentDicEntry["GROUP"]
	DemokrECTS.convertToEntity(ent)
	
func addAsTemplate(currentDicEntry, ent):
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

func addAsFlag(idx, ent):
	ent.addFlag(COMP.ATLAS_FLAGS.get(idx))

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

