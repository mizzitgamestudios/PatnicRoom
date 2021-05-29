extends MorphBox
class_name EffectMorphBox


var typeButton:  BaseButton
var currentType: int

var listOfStatMods        = SYNTAX.GET_STAT_MOD_TO_STRING()
var listOfCondtiions      = SYNTAX.GET_CONDITION_TO_STRING()
var currentListOfElements = []


func _ready() -> void:
	typeButton  = get_node("../CheckButton")
	currentType = ENUM.EFFECT_TYPE.UNSELECTED






func setCurrentListOfEffectsByType():
	if   currentType == ENUM.EFFECT_TYPE.CONDITION:  currentListOfElements  = listOfCondtiions
	elif currentType == ENUM.EFFECT_TYPE.STAT_MOD:   currentListOfElements  = listOfStatMods
	elif currentType == ENUM.EFFECT_TYPE.UNSELECTED: currentListOfElements  = []








func _on_Iten_Selected(index:int):
	var cache = SYNTAX.modules
	var selectedItem = get_item_text(index)
	var cacheThree = SYNTAX.masterAtlas
	selectedItem = SYNTAX.crossReferenceInputKeyword[selectedItem]
	var cacheTwo = cacheThree[selectedItem]
	cacheTwo = cacheTwo["inputModule"]
	cacheTwo = cache[cacheTwo]
	var toLoad = load(cacheTwo)
	toLoad = toLoad.instance()
	#get_tree().current_scene.add_child(toLoad)
	get_parent().add_child(toLoad)
	inputNode = toLoad
	


func getInputToString(): return self.getSelectToString()



