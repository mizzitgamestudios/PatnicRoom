###############################################################################################################################
#                                                                                                                             #
# Klasse:		InitDioJSONes                                                                                                 #
# description:	collects all GameData-JSON and tand converts them into Entities in their @DemocrECTS.allGroups                #
# data flow:	gets all Filepaths of GameData -> converts JSON to Entities -> adds them to Groups of ECTS                    #
# often called:	N/A                                                                                                           #
#                                                                                                                             #
###############################################################################################################################

extends Node
class_name InitDioJSONes



########################
# --- Variables ------ #
########################
var effektGenerator: DioJSONes_EffektGenerator;
var interpreter: DioJSONes_Interpreter;
var parser := JsonToEntityParser.new()



########################
# --- Init ----------- #
########################
func _init():
	DemokrECTS.groupManager.allGroups={}
	DemokrECTS.groupManager.initGroups()
	DioJSONes.initSubsystems();
	effektGenerator = DioJSONes.effektGenerator;
	interpreter = DioJSONes.interpreter;

	var listOfAllJSONs: Array = deserialiceTheCoinage("res://Gamedata")
	parseAll(listOfAllJSONs)
	effektGenerator.parseText("fihb")



########################
# --- Main ----------- #
########################
func parseAll(listOfAllJSONs):
	for i in listOfAllJSONs.size():
		var dictionary = Util.JSONParser.fileToDictionary(listOfAllJSONs[i])
		var y = parser.parse(dictionary)

func deserialiceTheCoinage(dirToScann : String) -> Array:
	var parsedFiles : Array = []
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

