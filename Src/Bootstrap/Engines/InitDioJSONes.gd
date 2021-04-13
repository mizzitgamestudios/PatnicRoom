extends Node
#//CLASS convertes JSON in GameData to game elements 
class_name InitDioJSONes


#VAR simple hack if your Inpector gets buggy again                                   
#VAR set bool true and insert in X your n'th file to stop,at breakpoint in @stopAt() 
var debugStop: bool = true
var stopAt: int = 20 

#----- INITIALICATION -------------------------------------------------------##


var _interpreter: DioJSONes_Interpreter
var parser := JsonToEntityParser.new()


#FUNC dynamicly builds Filepaths to JSONs                      
#FUNC parses them  into its corresponding group  of DemocrECTS 
func _init():
	DioJSONes.initSubsystems();
	
	_interpreter = DioJSONes.interpreter;
	
	var _listOfAllJSONs: Array = deserialiceTheCoinage(ENUM.BASE_GAME_DATA_PATH)
	parseAll(_listOfAllJSONs)

	_listOfAllJSONs = deserialiceTheCoinage("res://Gamedata/Custome/")
	parseAll(_listOfAllJSONs)


#----- DESERIALICATION ------------------------------------------------------##

#FUNC called recursive,needs no maintainance  
func deserialiceTheCoinage(dirToScann:String) -> Array:
	var parsedFiles: Array 
	var dir := Directory.new()

	dir.open(dirToScann)
	dir.list_dir_begin(true, false)
	var fileString := dir.get_next()

	while fileString != "":

		if dir.current_is_dir():
			parsedFiles += deserialiceTheCoinage(dir.get_current_dir() + "/" + fileString)
		

		elif fileString.ends_with(".json"):
			parsedFiles.append(dir.get_current_dir() + "/" + fileString)
		

		fileString = dir.get_next()
	
	return parsedFiles


					   
func parseAll(listOfAllJSONs):
	for i in listOfAllJSONs.size():
		var dictionary = Util.JSONParser.fileToDictionary(listOfAllJSONs[i])
		var returnForDebug = parser.parse(dictionary)
		
		stopForDebug(i,returnForDebug)
		

func stopForDebug(i:int, returnOfParser:Entity):
	if debugStop and i == stopAt:
		print(returnOfParser)
