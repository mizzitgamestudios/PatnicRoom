extends Control


var basicTrigger          
var listOfSpecificTrigger     = []
var triggerToShow = []

var numberOfSPecificTrigger   = 4
var NumberOfSpecificDisplayed = 1

func _ready() -> void:
	setUpNodeReferences()
	fillMorphBoxes()
	addToShow()
	




func setUpNodeReferences():
	basicTrigger = get_node("Basic/OptionButton")
	
	listOfSpecificTrigger = [
		get_node("Pairs/0/optionButton"),
		get_node("Pairs/1/optionButton"),
		get_node("Pairs/2/optionButton"),
		get_node("Pairs/3/optionButton")
	]
	
	triggerToShow = listOfSpecificTrigger


func fillMorphBoxes():
	basicTrigger.parseForInsert( SYNTAX.GET_TRIGGER_BASE_TO_STRING() )
	
	for i in listOfSpecificTrigger.size():
		var currentSpecificTrigger = listOfSpecificTrigger[i]
		currentSpecificTrigger.parseForInsert( SYNTAX.GET_TRIGGER_SPECIFIC_TO_STRING() )





func addToShow():
	var node = triggerToShow.pop_front()
	if is_instance_valid(node): 
		node.visible = true






func getUnits(effectCache:EffectCache):
	effectCache.triggerBase = Utils.foobar(basicTrigger.getInputToString())
	
	var cache = []
	for currentTrigger in listOfSpecificTrigger:
		var toString = currentTrigger.getInputToString()
		if toString != "": cache.append(Utils.foobar(toString))
		
	effectCache.triggerSpecific = cache
	return effectCache
