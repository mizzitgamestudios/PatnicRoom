extends Control

var effectTypeButton:           BaseButton
var currentUnselectedOptionBox: EffectMorphBox

var effectMode

var numberOfEffects           = 4
var listOfEffects             = []
 

func _ready() -> void:
	setUpNodeReferences()
	effectMode = ENUM.EFFECT_TYPE.UNSELECTED



func setUpNodeReferences():
	listOfEffects.clear()
	effectTypeButton = get_node("CheckButton")
	listOfEffects.append( get_parent().get_node("Pairs/0/Panel/input") )
	listOfEffects.append( get_parent().get_node("Pairs/1/Panel/input") )
	listOfEffects.append( get_parent().get_node("Pairs/2/Panel/input") )
	listOfEffects.append( get_parent().get_node("Pairs/3/Panel/input") )


var counter = 0
func getScrollContainer(string):
	if counter == 4: 
		counter = 0
		for i in range(0,4):listOfEffects[i].bbcode_text = ""
	
	listOfEffects[counter].bbcode_text = string
<<<<<<< HEAD
	if string != "":
		var keyword = SYNTAX.crossReferenceInputKeyword[string]
		var moduleName = SYNTAX.masterAtlas[keyword]["moduleName"]
		
		
		var loadedScene = Utils.getLoadedModule(moduleName)
		if is_instance_valid(loadedScene):
			var inst = loadedScene.instance()
			listOfEffects[counter].inputModule = inst
			if listOfEffects[counter].inputModule is Condition_Effect:
				listOfEffects[counter].inputModule.effectShortName=keyword
			listOfEffects[counter].get_parent().add_child(inst)
			counter += 1
=======
	counter += 1
>>>>>>> 14ed4bc523602584d0fecdfce3fc61f9ee8a2684



func getUnits(effectCache:EffectCache):
	var cacheCond = []
	var cacheStat = []
<<<<<<< HEAD
	
	for entry in listOfEffects:
		if is_instance_valid(entry.inputModule):
			
			var value = entry.inputModule.getInputToString()
			var keyword = entry.getInputToString()
			
		
				
			if SYNTAX.GET_CONDITION_TO_STRING().has(entry.getInputToString()): 
				cacheCond.append(value)
				
			if SYNTAX.GET_STAT_MOD_TO_STRING().has(entry.getInputToString()): 
				cacheStat.append([Utils.foobar(keyword),value])
		
=======
	for entry in listOfEffects:
		var toString = entry.getInputToString()
		if toString != "":
			if SYNTAX.GET_CONDITION_TO_STRING().has(entry.getInputToString()): cacheCond.append(toString)
			if SYNTAX.GET_STAT_MOD_TO_STRING().has(entry.getInputToString()): cacheStat.append(toString)
>>>>>>> 14ed4bc523602584d0fecdfce3fc61f9ee8a2684
	
	effectCache.effectCondition = cacheCond
	effectCache.effectStatmod   = cacheStat
	
	return effectCache


	
