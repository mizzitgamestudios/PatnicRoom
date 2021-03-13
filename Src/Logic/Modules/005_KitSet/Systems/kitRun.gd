extends Component
class_name _5_KitRun


func runKitSet(kitset):
	var initialCondition = kitset.initialSelect["EFFECT_CONDITION"]
	var initialStat      = kitset.initialSelect["EFFECT_STAT_MOD"]
	
	statModParse(initialStat.statModList)
	conditionParse(initialCondition.condtionList)
	
	API_011_Player.getSelectedTilesComp().resetAlerted()


func statModParse(statModArray):
	var selectedTiles   = API_011_Player.getSelectedTilesComp().getAlerted()
	for i in statModArray.size():

		var currentTile = selectedTiles [0]
		var currentStat = statModArray  [i]
		
		var keyword     = currentStat   [0]
		var modValue    = currentStat   [1]

		for j in currentTile.size():
			if   DIOJSONES_SYNTAX.EFFECT_UNIQUE_STATMOD.has(keyword):  DIOJSONES_UNIQUE_STATMOD.manageUniqueStatmod(currentTile[j],keyword,modValue)
			elif COMP.ATLAS_INDEX_COMP.has(keyword):                   HeGEL.changeStat(currentTile[j].getComp(keyword),modValue)





func conditionParse(statModArray):
	var selectedTiles   = API_011_Player.getSelectedTilesComp().getAlerted()
	for i in statModArray.size():

		var currentCond = statModArray [i]
		var currentSelect = selectedTiles[i]
		
		API_003_Condition.attachConditionToEnt(currentSelect[i], currentCond.indexName, currentCond.duration, currentCond.level)
		
		#if   API_003_Condition.getAllConditions().has(keyword):  API_003_Condition.attachConditionToEnt(currentTile[j],keyword,duration,intensity)




















