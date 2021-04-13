extends Node
class_name _011_Chargen


func generateNewChar():
	var filledChargenPreset = getFilledChargenPreset()
	
	
	insertDebugKits(filledChargenPreset)
	
	API_011_Player.setCurrentCharByDict(filledChargenPreset)




func getFilledChargenPreset():
	var dictOfPlayer = API_011_Player.chargenSelecttion
	var kitArray
	if API_011_Player.chargenSelecttion["Kits"] != "NULL":
		var randomKit    = randomSelectkit( API_011_Player.chargenSelecttion["Kits"])
		var arr          = []
		kitArray         = []
		
		if API_011_Player.chargenSelecttion["Kits"] is String :
			arr.append(randomKit)
			arr.append("NULL")
			arr.append("NULL")
		
		kitArray.append(arr)
	
	else:
		 kitArray= [["NULL","NULL","NULL"]]
	
	API_011_Player.chargenSelecttion["Kits"] = kitArray
	
	
	return dictOfPlayer


func insertDebugKits(filledChargenPreset:Dictionary):
	var kits = Util.JSONParser.fileToDictionary("res://tools/debugKitsAtStart.json")
	for i in kits["kitsAtStart"].size():
		var kitsetsToLoad = fillBySpecificKit(kits["kitsAtStart"][i])
		filledChargenPreset["Kits"].append(kitsetsToLoad)





func fillBySpecificKit(kitArr):
	var returnArr = []
	for i in kitArr.size():
		
		if kitArr[i] == "NULL": returnArr.append("NULL")
		
		if kitArr[i] != "NULL":
			var kit = API_017_Atlas.getKitByDrirectName(kitArr[i])
			returnArr.append(kit)
		
		
	return returnArr

func randomSelectkit(kit:String):
	var group = API_017_Atlas.getKitGroup(kit)
	var rng = Util.RNG.getRandomNumber(0,group.size()-1)

	return group.values()[rng].baseKit

	

