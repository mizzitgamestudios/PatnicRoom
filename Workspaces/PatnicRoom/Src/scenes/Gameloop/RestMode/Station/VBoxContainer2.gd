extends VBoxContainer

var listOfEntries = []
var counter = 0
func _ready() -> void:
	parseAll()

func parseAll():
	listOfEntries = []
	for entry in self.get_children(): entry.queue_free()
	
	var kitsetGeared = API_006_Player.currentChar.kitventory.gearedKitset
	
	
	for entry in kitsetGeared.listOfKits.values(): parseSet(entry)
	

func parseSet(entry):
	
	if is_instance_valid(entry.base):
		var entryClass = Entry.new(entry.base)
		loadEntry(entry.base,entryClass)
		listOfEntries.append(entryClass)



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


class Entry:
	var mType
	var part
	var category
	var kitset
	var scene
	func _init(kitsetPara) -> void:
		mType = kitsetPara.mType()
		category = kitsetPara.catType()
		kitset = kitsetPara
		
		if str(kitsetPara.partType()) == "0": part = "BASE"
		if str(kitsetPara.partType()) == "1": part = "MOD"
		if str(kitsetPara.partType()) == "2": part = "APPENDIX"

