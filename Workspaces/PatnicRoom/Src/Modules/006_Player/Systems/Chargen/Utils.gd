extends Node
class_name _011_Utils



static func generateCharPreset() -> void:
	var dictOfCharGenerall = Util.JSONParser.fileToDictionary("res://config/Savestate/One/Runner/generated/generall and stats.json")
	var dictOfCharInventory = Util.JSONParser.fileToDictionary("res://config/Savestate/One/Runner/generated/Inventory.json")
	
	dictOfCharGenerall["Gear"] = dictOfCharInventory["Gear"]
	dictOfCharGenerall["Kits"] = dictOfCharInventory["Kits"]
	
	dictOfCharGenerall.erase("//C1")
	dictOfCharGenerall.erase("//C2")
	dictOfCharGenerall.erase("//C3")
	
	API_006_Player.chargenSelecttion = dictOfCharGenerall

