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
	#API_006_Player.getSelectedTilesComp().resetAlerted()
	for i in statModArray.size():

		var currentTile = selectedTiles [0]
		var currentStat = statModArray  [i]
		var keyword
		var modValue
		
		if currentStat.size() == 2:
			keyword     = currentStat   [0]
			modValue    = currentStat   [1]
		
		if currentStat.size() == 1:
			keyword     = currentStat   [0]
			modValue    = 0
			
		if currentStat.size() == 3:
			keyword     = currentStat   [0]
			modValue    = [currentStat[1],currentStat[2]]


		for j in currentTile.size():
			if API_009_Statmod.hasStatmodInIndex(keyword): API_009_Statmod.manageUniqueStatmod(currentTile[j],keyword,modValue)
			elif COMP.ATLAS_INDEX_COMP.has(keyword):                   
				HeGEL.changeStat(currentTile[j],keyword,modValue)





func conditionParse(statModArray):
	var selectedTiles   = API_006_Player.getSelectedTilesComp().getAlerted()
	for i in statModArray.size():

		var currentCond = statModArray [i]
		var currentSelect = selectedTiles[i]
		
		API_008_Condition.attachConditionToEnt(currentSelect[i], currentCond.indexName_quack(), currentCond.duration, currentCond.level)
		
		#if   API_008_Condition.getAllConditions().has(keyword):  API_008_Condition.attachConditionToEnt(currentTile[j],keyword,duration,intensity)




















