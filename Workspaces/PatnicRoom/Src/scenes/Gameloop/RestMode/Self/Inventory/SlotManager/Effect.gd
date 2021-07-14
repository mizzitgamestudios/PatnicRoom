extends Control


onready var arrOfConditions = self.get_node("condition/list")
onready var arrOfStatmods = self.get_node("statmod/list")


func _ready() -> void: resetForm()


func manageEffect(slot):
	resetForm()
	fillCondition(slot.effectCondition)
	fillStatmod(slot.effectStatmod)
	


func resetForm():
	for entry in arrOfConditions.get_children():  entry.visible = false
	for entry in arrOfStatmods.get_children():    entry.visible = false


func fillCondition(unit):
	for i in unit.condtionList.size():
		var currentCondition = unit.condtionList[i]
		var currentPanel     = arrOfConditions.get_node(str(i))
		currentPanel.visible = true
		
		currentPanel.get_node("name").bbcode_text      = currentCondition.toString_quack()
		currentPanel.get_node("duration").bbcode_text  = str(currentCondition.duration)
		currentPanel.get_node("intensity").bbcode_text = str(currentCondition.level)



func fillStatmod(unit):
	for i in unit.statModList.size():
		var currentStatmod   = unit.statModList[i]
		var currentPanel     = arrOfStatmods.get_node(str(i))
		currentPanel.visible = true
		
		currentPanel.get_node("RTL").bbcode_text = currentStatmod.getValueToString_quack()
		
		pass



func statModToString(statmod):
	var doc = statmod.getDoc()
	var toShort = doc["toShort"]
	var keyword = doc["keyword"]
	
	
	if keyword == "U_CHANGE_RAW_VALUE":  return changeRawValue(statmod)
	if keyword == "U_SPAWN_TILE_AROUND": return spawnTileAround(statmod)

	
	
	
	
	else: return toShort


func changeRawValue(statmod):
	var nameComp = COMP.GET_COMPONENT(statmod.compToString).getAutoDoc()["nameToShow"]
	var valueComp = str(statmod.newValue)
	return nameComp+" : "+valueComp


func spawnTileAround(statmod):
	var tileName = API_001_Atlas.TileAtlas()[ statmod[1][0] ].tileName()
	return "spawns "+tileName+" "+str(statmod[1][2])+" Tiles around"




