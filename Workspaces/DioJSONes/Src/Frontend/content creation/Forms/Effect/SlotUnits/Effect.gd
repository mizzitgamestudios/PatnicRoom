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
	counter += 1



func getUnits(effectCache:EffectCache):
	var cacheCond = []
	var cacheStat = []
	for entry in listOfEffects:
		var toString = entry.getInputToString()
		if toString != "":
			if SYNTAX.GET_CONDITION_TO_STRING().has(entry.getInputToString()): cacheCond.append(toString)
			if SYNTAX.GET_STAT_MOD_TO_STRING().has(entry.getInputToString()): cacheStat.append(toString)
	
	effectCache.effectCondition = cacheCond
	effectCache.effectStatmod   = cacheStat
	
	return effectCache


	
