extends Node


var templateDependentJSON = []


# FUNC builds a Filepath (String) to a file,starting by GameData 
func parseFromArray(pathArray : Array):
	var path = ENUM.BASE_GAME_DATA_PATH + PoolStringArray(pathArray).join("/")
	if path.substr(path.length() - 5) != ".json":
		path += ".json"
	return self.parsePathToDict(path)


func parsePathToDict(path : String):
	return Util.JSONParser.fileToDictionary(path)


