extends Node
class_name JsonToEntityParser
#//CLASS Hub for Interpreting JSON-Files of GameData :                 
#//CLASS every Dataset is wrapped as an Object with a String-key       
#//CLASS the String equals an entry of ENUM.JSON_KEY_TYPE              

func parse(dictionary : Dictionary) -> Entity:
	var ent : Entity = Entity.new()
	
	for entries in dictionary.size(): 
		
		var currentKey      = dictionary.keys()[entries]
		var currentValue    = dictionary.values()[entries]
		
		var compClass       = COMP.GET_BOTH(currentKey)
		
		if compClass is int                                :addAsFlag       (currentKey,                                    ent)
		
		elif compClass.dioJSONType_quack() == "STRING"     : addAsSimpleComp (currentKey,        str        (currentValue),  ent)
		elif compClass.dioJSONType_quack() == "INTEGER"    : addAsSimpleComp (currentKey,        int        (currentValue),  ent)
		elif compClass.dioJSONType_quack() == "BOOLEAN"    : addAsSimpleComp (currentKey,        bool       (currentValue),  ent)
		
		elif compClass.dioJSONType_quack() == "ARRAY"      : addAsArrOrDict  (currentKey,                    currentValue ,  ent)
		elif compClass.dioJSONType_quack() == "DICTIONARY" : addAsArrOrDict  (currentKey,                    currentValue ,  ent)
		
		elif compClass.dioJSONType_quack() == "EFFECT"     : addAsEffect     (currentKey,                    currentValue ,  ent)
		elif compClass.dioJSONType_quack() == "TEMPLATE"   : addAsTemplate   (                               currentValue ,  ent)
		elif compClass.dioJSONType_quack() == "CONTAINER"  : addAsSimpleComp (currentKey, _recursiveSelfCall(currentValue),  ent)
	
	
	
	
	return DemokrECTS.convertToEntity(ent)




# --- Basic --- #
func addAsSimpleComp(currentKey, currentValue, ent):
	var compConstructor = DioJSONes_SubParser_ComponentConstructor.new(currentKey, currentValue)
	var component = compConstructor.run()
	ent.addComponent(component)


func addAsArrOrDict(idx,currentDicEntry, ent):
	var compConstructor = DioJSONes_SubParser_ComponentConstructor.new(idx, currentDicEntry)
	var component = compConstructor.run()
	ent.addComponent(component)


func addAsEffect(idx,currentDicEntry, ent):
	var dicToBuildComp = currentDicEntry
	var compConstructor = DioJSONes_SubParser_ComponentConstructor.new(idx, dicToBuildComp)
	var component = compConstructor.run()
	ent.addComponent(component)


# --- Advanced Parsere --- #
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
