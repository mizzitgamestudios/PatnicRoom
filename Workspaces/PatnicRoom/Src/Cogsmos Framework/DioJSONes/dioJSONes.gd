extends Node


<<<<<<< HEAD
var templateDependentJSON = []


# FUNC builds a Filepath (String) to a file,starting by GameData 
func parseFromArray(pathArray : Array):
	var path = ENUM.BASE_GAME_DATA_PATH + PoolStringArray(pathArray).join("/")
=======

# FUNC builds a Filepath (String) to a file,starting by GameData 
func parseFromArray(pathArray : Array):
	var path : String = ENUM.BASE_GAME_DATA_PATH + PoolStringArray(pathArray).join("/")
>>>>>>> 14ed4bc523602584d0fecdfce3fc61f9ee8a2684
	if path.substr(path.length() - 5) != ".json":
		path += ".json"
	return self.parsePathToDict(path)


func parsePathToDict(path : String):
	return Util.JSONParser.fileToDictionary(path)


