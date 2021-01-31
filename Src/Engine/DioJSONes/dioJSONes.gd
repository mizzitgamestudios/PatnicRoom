###############################################################################################################################
#                                                                                                                             #
# Klasse:		--- DioJSONes ---                                                                                         #
# description:	Responsible for the generation of Game-elements,ecspecially Chunks #
#                                                                                                                             #
# data flow:	External JSON -> Tilemap(ActorLayer)                                                                          #
# often called:	N/A                                                                                                           #
#                                                                                                                             #
###############################################################################################################################

extends Node

onready var effektGenerator: DioJSONes_EffektGenerator
onready var interpreter: DioJSONes_Interpreter

func initSubsystems():
	interpreter = DioJSONes_Interpreter.new()
	effektGenerator = DioJSONes_EffektGenerator.new()



func parseFromArray(pathArray : Array):
	var path : String = ENUM.BASE_GAME_DATA_PATH + PoolStringArray(pathArray).join("/")
	if path.substr(path.length() - 5) != ".json":
		path += ".json"
	return self.parsePathToDict(path)

func parsePathToDict(path : String):
	return Util.JSONParser.fileToDictionary(path)


