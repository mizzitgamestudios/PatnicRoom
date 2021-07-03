
# CLASS convertes JSON in GameData to game elements                                   
# CLASS                                                                              
extends Node
class_name InitDioJSONes


# VAR simple hack if your Inpector gets buggy again                                   
# VAR change value to n to stop at the n'th file to stopand at a breakpoint at L.25   
# VAR set the value to -1 for no breakpointing                                        
<<<<<<< HEAD
var stopAt: int = 24
=======
var stopAt: int = -1
>>>>>>> 14ed4bc523602584d0fecdfce3fc61f9ee8a2684



# ----- INITIALICE ----------------------------------------------------------------##


var parser     = JsonToEntityParser.new()
var dirManager = Directory.new()

func _init():
<<<<<<< HEAD
	var listOfAllJSONs  = deserialiceTheCoinage(ENUM.DIOJSONES.BASE_GAME_DATA_PATH)
	var allDictsToParse = []
	
	for i in listOfAllJSONs.size():
		var cache = Util.JSONParser.fileToDictionary(listOfAllJSONs[i])
		allDictsToParse.append(cache)
	
	parser.parseGameData(allDictsToParse)
=======
	var listOfAllJSONs = deserialiceTheCoinage(ENUM.BASE_GAME_DATA_PATH)
	
	for i in listOfAllJSONs.size():
		var dictionary     = Util.JSONParser.fileToDictionary(listOfAllJSONs[i])
		var returnForDebug = parser.parse(dictionary)
		
		if stopAt != -1 and stopAt == i:
			print("DEBUG")

			
>>>>>>> 14ed4bc523602584d0fecdfce3fc61f9ee8a2684

# ----- FILEPATH-GETTER ----------------------------------------------------- ##


func deserialiceTheCoinage(dirToScann:String) -> Array:
	var parsedFiles: Array 
	var dir := Directory.new()

	dir.open(dirToScann)
	dir.list_dir_begin(true, false)
	var fileString = dir.get_next()
	
	
	while fileString != "":
		var currentFilepath = dir.get_current_dir() + "/" + fileString
		
		if dir.current_is_dir(): 			parsedFiles += deserialiceTheCoinage(currentFilepath)
		elif fileString.ends_with(".json"):	parsedFiles.append(currentFilepath)
		
		fileString = dir.get_next()
	
	
	return parsedFiles


