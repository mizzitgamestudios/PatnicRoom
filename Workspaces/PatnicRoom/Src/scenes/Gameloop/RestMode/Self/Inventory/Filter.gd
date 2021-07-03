extends Panel


var mType = ["reset","Magic","Matrix","Meat"]
var part = ["reset","Base","Mod","Appendix"]
var category = ["reset","Gun","Meele","Armor","Drone","Hack","Cyberware","Spell","Infusion","Rite"]

func _ready() -> void:
	for entry in mType: get_node("mType").add_item(entry)
	for entry in part: get_node("part").add_item(entry)
	for entry in category: get_node("category").add_item(entry)



func reload(select,type):
	var optionBox = get_node(type)
	var toFilter  = optionBox.get_item_text(select).to_upper()
	
	if toFilter == "RESET":   get_node("../ScrollContainer/VBoxContainer2").parseAll()
	else:                   check(toFilter)



func check(toFilter):
	var list = get_node("../ScrollContainer/VBoxContainer2").listOfEntries
	for entry in list:
		if entry.mType == toFilter: entry.scene.queue_free()
		if entry.part == toFilter: entry.scene.queue_free()
		if entry.category == toFilter: entry.scene.queue_free()

