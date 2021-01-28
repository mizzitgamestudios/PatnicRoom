extends Node
class_name InitDioJSONes


var effektGenerator: DioJSONes_EffektGenerator;
var interpreter: DioJSONes_Interpreter;


var parser := JsonToEntityParser.new()

func _init():
	DemokrECTS.groupManager.allGroups={}
	DemokrECTS.groupManager.initGroups()
	DioJSONes.initSubsystems();
	effektGenerator = DioJSONes.effektGenerator;
	interpreter = DioJSONes.interpreter;


	var listOfAllJSONs: Array = deserialiceTheCoinage("res://Gamedata")
	parseAll(listOfAllJSONs)
	effektGenerator.parseText("fihb")
	
	
	


 
func parseAll(listOfAllJSONs):
	for i in listOfAllJSONs.size():
		var dictionary = Util.JSONParser.fileToDictionary(listOfAllJSONs[i])
		var y = parser.parse(dictionary)

func deserialiceTheCoinage(scan_dir : String) -> Array:
	var my_files : Array = []
	var dir := Directory.new()

	dir.open(scan_dir)
	dir.list_dir_begin(true, false)
	var file_name := dir.get_next()

	while file_name != "":
		if dir.current_is_dir():
			my_files += deserialiceTheCoinage(dir.get_current_dir() + "/" + file_name)
		
		elif file_name.ends_with(".json"):
			my_files.append(dir.get_current_dir() + "/" + file_name)
		
		file_name = dir.get_next()
	return my_files
