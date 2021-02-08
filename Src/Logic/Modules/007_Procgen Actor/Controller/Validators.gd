extends Node
class_name _03_00_Validator






func checkDictForTileGeneration(dict:Dictionary):
	var valid: bool = true
	var missingKeys: Array = []
	var neededKeys: Array = ENUM.minimalNeededComponentsForTiles

	for i in neededKeys.size():
		if !dict.has(neededKeys[i]):
			valid = false
			missingKeys.append(neededKeys[i])
	
	if !valid:
		API_000_BasicTilesAtlas.logger._print_head_log_entry()
		for i in missingKeys.size():
			API_000_BasicTilesAtlas.logger.logMissingKeyInDictForTileGeneration(missingKeys[i])
	
	return valid

func checkIsSearchedStringInAtlas(componentString:String):
	var possibleComps: Array = ENUM.minimalNeededComponentsForTiles

	if possibleComps.has(componentString):
		return true
	else:
		return false



