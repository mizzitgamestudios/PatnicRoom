extends VBoxContainer

var listOfEntries = []
var counter = 0


func _ready() -> void:
	listOfEntries = []
	for entry in self.get_children(): entry.queue_free()
	
	var kitsetGeared = API_006_Player.currentChar.kitventory.gearedKitset
	var kitventory   = API_006_Player.currentChar.kitventory.kitventory
	
	var allKitParts  = getAllKitParts(kitsetGeared,kitventory)
	
	for kitPart in allKitParts:
		var inventoryEntry = Entry.new(kitPart)
		loadEntry(kitPart,inventoryEntry)
		listOfEntries.append(inventoryEntry)



class Entry:
	var mType ; var part ; var category ; var kitset ; var scene
	
	func _init(kitsetPara) -> void:
		mType    = kitsetPara.mType()
		category = kitsetPara.catType()
		kitset   = kitsetPara
		
		if str(kitsetPara.partType()) == "0": part = "BASE"
		if str(kitsetPara.partType()) == "1": part = "MOD"
		if str(kitsetPara.partType()) == "2": part = "APPENDIX"




func loadEntry(kitset,entryClass):
	var root = get_node("../../..")
	var sceneToLaod = load(getScene()).instance()
	sceneToLaod.initialice(kitset,root)
	entryClass.scene = sceneToLaod
	
	add_child(sceneToLaod)
	counter += 1 



func getScene():
	if counter % 2 == 0: return"res://Src/scenes/Gameloop/RestMode/Self/Inventory/Subscene/KitSetEntryOne.tscn"
	else:                return "res://Src/scenes/Gameloop/RestMode/Self/Inventory/Subscene/KitSetEntryTwo.tscn"









func getAllKitParts(kitsetGeared,kitventory):
	var allKitParts = []
	allKitParts += convertKitSetToParts(kitsetGeared)
	allKitParts += kitventory.listOfKits.values()
	return allKitParts


func convertKitSetToParts(kitsetGeared):
	var cacheToReturn = []
	var allKitSets    = kitsetGeared.listOfKits.values()
	
	for entry in allKitSets:
		if is_instance_valid(entry.base)     : cacheToReturn.append(entry.base)
		if is_instance_valid(entry.mod)      : cacheToReturn.append(entry.mod)
		if is_instance_valid(entry.appendix) : cacheToReturn.append(entry.appendix)
	
	return cacheToReturn
