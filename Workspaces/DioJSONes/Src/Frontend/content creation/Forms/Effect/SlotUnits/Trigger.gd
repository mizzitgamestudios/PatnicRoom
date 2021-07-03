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
<<<<<<< HEAD
	effectCache.triggerBase = Utils.foobar(basicTrigger.getInputToString())
=======
	effectCache.triggerBase = basicTrigger.getInputToString()
>>>>>>> 14ed4bc523602584d0fecdfce3fc61f9ee8a2684
	
	var cache = []
	for currentTrigger in listOfSpecificTrigger:
		var toString = currentTrigger.getInputToString()
<<<<<<< HEAD
		if toString != "": cache.append(Utils.foobar(toString))
=======
		if toString != "": cache.append(toString)
>>>>>>> 14ed4bc523602584d0fecdfce3fc61f9ee8a2684
		
	effectCache.triggerSpecific = cache
	return effectCache
