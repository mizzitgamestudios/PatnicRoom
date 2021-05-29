extends Node
class_name Statistics_kitparts_JSON







static func calcStats():
	# VARIABLES   
	var atlas          = API_001_Atlas.KitParts()
	var statDict       = {}
	var statDictSize   = {}
	
	var mType          = ENUM.M_TYPES
	var kitPart        = ENUM.KIT_PARTS
	
	var allCategories  = ENUM.KIT_CATEGORIES
	var categoryMatrix = ENUM.KIT_CAT_MATRIX
	var categoryMagic  = ENUM.KIT_CAT_MAGIC
	var categoryMeat   = ENUM.KIT_CAT_MEAT

	var mdWriter       = MarkdownWriter.new()
	


	# PROCEDURE
	
	# --- add Ents --- #
	statDict["allMTypes"]         = addAllOfMType(mType,atlas)
	statDict["BaseModMTypes"]     = addKitsAndModsByMType(mType,atlas)
	statDict["categories"]        = addByCategories()

	# --- get size --- #
	statDictSize["allMTypes"]     = getSizeOfAllTypes()
	statDictSize["BaseModMTypes"] = getSizeOfKitsAndMods()
	statDictSize["categories"]    = getSizeOfCategories()
	
	
	var file = File.new()
	file.open("res://tools/Statistics/output/Kitparts.json",File.WRITE)
	file.store_line(to_json(statDictSize))
	file.close()




# ---- GET ENTITIES ----

static func addAllOfMType(mType,atlas):
	var dict = {}
	for i in mType.size():
		dict[ mType[i] ] = atlas.getEntitiesWithCompValue(mType[i],"C_37_ANY_M_TYPE")
	return dict


static func addKitsAndModsByMType(mType,atlas):
	var dict = {}
	for i in mType.size(): 
		dict[ mType[i]+"_"+kitPart[0] ] = atlas.getEntsWithValueOfCompInArray(statDict["allMTypes"][mType[i]].values(), "C_38_KIT_PART_TYPE", "BASE")
		dict[ mType[i]+"_"+kitPart[1] ] = atlas.getEntsWithValueOfCompInArray(statDict["allMTypes"][mType[i/2]].values(), "C_38_KIT_PART_TYPE", "MOD" )
	return dict


static func addByCategories():
	var dict = {}

	dict["HACK"]      = atlas.hack.values()
	dict["CYBERWARE"] = atlas.cyberware.values()
	dict["DRONE"]     = atlas.drone.values()
	
	dict["ARMOR"]     = atlas.armor.values()
	dict["GUN"]       = atlas.gun.values()
	dict["MEELE"]     = atlas.meele.values()
	
	dict["SPELL"]     = atlas.spell.values()
	dict["INFUSION"]  = atlas.infusion.values()
	dict["RITE"]      = atlas.rite.values()

	return dict









static func getSizeOfAllTypes():
	var dict = {}
	for i in 3: dict[mType[i]]=""
	
	for i in statDict["allMTypes"].size():
		dict[mType[i]] = statDict["allMTypes"][mType[i]].size()
	
	return dict


static func getSizeOfKitsAndMods():
	var currentDict = statDict.values()[1]
	var dict = {}
	for i in 3: dict[mType[i]]={}

	for i in currentDict.size()/2: 
		dict[mType[i]]["BASE"] = currentDict[mType[i]+"_BASE"].size()
		dict[mType[i]]["MOD"]  = currentDict[mType[i]+"_MOD"].size()

	return dict


static func getSizeOfCategories():
	var dict = {}
	for i in statDict["categories"].size():
		var currentKey    = statDict["categories"].keys()[i]
		var currentValues = statDict["categories"].values()[i].size()

		dict[currentKey]  = currentValues

	return dict












static func getEntsWithValueOfCompInArray(arr:Array,comp:String,value):
	var returnArr = []

	for i in arr.size():
		var currentEnt = arr[i]

		if currentEnt.has(comp):
			if currentEnt.getCompValue(comp) == value:

				returnArr.append(currentEnt)
		
	return returnArr
