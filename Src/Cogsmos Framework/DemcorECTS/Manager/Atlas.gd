extends Object
class_name DemokrECTS_Atlas


#----- INITIALICE ------------------------------------------------------------##

var atlas_Entry  = {}
var classOfEntries
var indexComponent : String

 

#----- GETTER ----------------------------------------------------------------##

func getTileByTextureID(textureID:String):
	if atlas_Entry.keys().has(textureID): return atlas_Entry[textureID]
	else: return null



func has(ent):
	return atlas_Entry.has(ent)



func getEntitiesWithCompValue(searchedTerm,componentClass):
	var returnArr = []
	for i in atlas_Entry.values().size():
	
		var currentEnt = atlas_Entry.values()[i]
		if currentEnt.has(componentClass):
			if currentEnt.getCompValue(componentClass) == searchedTerm:
				returnArr.append(currentEnt)
	
	var returnDict = {}
	for i in returnArr.size():
		returnDict[returnArr[i].getCompValue(indexComponent)] = returnArr[i]
	
	return returnDict



func getEntitiesWithComp(componentClass):
	var returnArr = []
	for i in atlas_Entry.values().size():

		var currentEnt = atlas_Entry.values()[i]
		if currentEnt.has(componentClass):
			returnArr.append(currentEnt)

	return returnArr
			


#----- SETTER ----------------------------------------------------------------##


func addEntity(ent):
	if ent is classOfEntries:
		if !has(ent):
		
			atlas_Entry[ent.getCompValue(indexComponent)] = ent
		
		else: printError(str(ent.name())+" already exists")
	else: printError(str(ent.name())+" could not be added")




func printError(customeMessage:String):
	print("!!error in Atlas_TileEntity!!")
	print(customeMessage)
	print("-----------------")
