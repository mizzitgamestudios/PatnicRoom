extends MorphBox
class_name TriggerMorphBox


var typeButton:  BaseButton
var currentType: int

var listOfStatMods        = SYNTAX.GET_STAT_MOD_TO_STRING()
var listOfCondtiions      = SYNTAX.GET_CONDITION_TO_STRING()
var currentListOfElements = []


func _ready() -> void:
	typeButton  = get_node("../CheckButton")
	currentType = ENUM.EFFECT_TYPE.UNSELECTED



func _on_ItemSelected(index:int) -> void:
	var selectedItem = get_item_text(index)
	get_node("../../..").addToShow()
	remove_child(inputNode)
	
	
	var keyword = SYNTAX.crossReferenceInputKeyword[selectedItem]
	var module = SYNTAX.masterAtlas[keyword]["moduleName"]
	if module != "VOID":
		inputNode = Utils.getLoadedModuleByToString(selectedItem)
		inputNode = inputNode.instance()
		self.add_child(inputNode)
		

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



