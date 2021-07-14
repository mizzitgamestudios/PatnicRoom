extends Component
class_name _5_KitRun


func runKitSet(kitset):
	var initialCondition = kitset.initialSelect["EFFECT_CONDITION"]
	var initialStat      = kitset.initialSelect["EFFECT_STAT_MOD"]
	
	statModParse(initialStat.statModList)
	conditionParse(initialCondition.condtionList)
	
	API_006_Player.getSelectedTilesComp().resetAlerted()


func statModParse(statModArray):
	var selectedTiles   = API_006_Player.getSelectedTilesComp().getAlerted()
	
	for currentStatmod in statModArray:
		for currentEnt in selectedTiles:
			currentStatmod.run(currentEnt)






func conditionParse(statModArray):
	var selectedTiles   = API_006_Player.getSelectedTilesComp().getAlerted()
	for i in statModArray.size():

		var currentCond = statModArray [i]
		var currentSelect = selectedTiles[i]
		
		API_008_Condition.attachConditionToEnt(currentSelect[i], currentCond.indexName_quack(), currentCond.duration, currentCond.level)
		

