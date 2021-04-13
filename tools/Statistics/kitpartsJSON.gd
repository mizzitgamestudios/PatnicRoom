extends Node


var atlas          : DemokrECTS_Atlas
var statDict       = {}
var statDictSize   = {}

var mType          = [ "MEAT"  , "MAGIC" , "MATRIX"     ]
var kitPart        = [ "BASE"  , "MOD"   , "APPENDIX"   ]

var categoryMatrix = [ "HACK"  , "DRONE" , "CYBERWARE" ]
var categoryMagic  = [ "SPELL" , "RITE"  , "INFUSION"  ]
var categoryMeat   = [ "MEELE" , "GUN"   , "ARMOR"     ]
var allCategories  = [ categoryMagic,categoryMatrix,categoryMeat]


func getKitpartsJSON():
	atlas = API_017_Atlas.getKitpartsAtlas()
	
	# --- add Ents --- #
	statDict["allMTypes"]         = addAllOfMType()
	statDict["BaseModMTypes"]     = addKitsAndModsByMType()
	statDict["categories"]        = addByCategories()

	# --- get size --- #
	statDictSize["allMTypes"]     = getSizeOfAllTypes()
	statDictSize["BaseModMTypes"] = getSizeOfKitsAndMods()
	statDictSize["categories"]    = getSizeOfCategories()
	
	
	var file = File.new()
	file.open("res://Documentation/Statistics/Kitparts.json",File.WRITE)
	file.store_line(to_json(statDictSize))
	file.close()
	






func addAllOfMType():
	var dict = {}
	for i in mType.size(): dict[ mType[i] ] = atlas.getEntitiesWithCompValue(mType[i],"C_37_ANY_M_TYPE")

	return dict


func addKitsAndModsByMType():
	var dict = {}
	for i in mType.size(): 
		dict[ mType[i]+"_"+kitPart[0] ] = getEntsWithValueOfCompInArray(statDict["allMTypes"][mType[i]].values(), "C_38_KIT_PART_TYPE", "BASE")
		dict[ mType[i]+"_"+kitPart[1] ] = getEntsWithValueOfCompInArray(statDict["allMTypes"][mType[i/2]].values(), "C_38_KIT_PART_TYPE", "MOD" )

	return dict


func addByCategories():
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









func getSizeOfAllTypes():
	var dict = {}
	for i in 3: dict[mType[i]]=""
	
	for i in statDict["allMTypes"].size():
		dict[mType[i]] = statDict["allMTypes"][mType[i]].size()
	
	return dict


func getSizeOfKitsAndMods():
	var currentDict = statDict.values()[1]
	var dict = {}
	for i in 3: dict[mType[i]]={}

	for i in currentDict.size()/2: 
		dict[mType[i]]["BASE"] = currentDict[mType[i]+"_BASE"].size()
		dict[mType[i]]["MOD"]  = currentDict[mType[i]+"_MOD"].size()

	return dict


func getSizeOfCategories():
	var dict = {}
	for i in statDict["categories"].size():
		var currentKey    = statDict["categories"].keys()[i]
		var currentValues = statDict["categories"].values()[i].size()

		dict[currentKey]  = currentValues

	return dict












func getEntsWithValueOfCompInArray(arr:Array,comp:String,value):
	var returnArr = []

	for i in arr.size():
		var currentEnt = arr[i]

		if currentEnt.has(comp):
			if currentEnt.getCompValue(comp) == value:

				returnArr.append(currentEnt)
		
	return returnArr
