extends Node

var alltypes
var types
var typeRequirements
var numberOfReqirements
func _ready():
	alltypes = getAllJSONTypes("res://config/types")
	types = fileToDictionary("res://config/types.json")
	typeRequirements = fileToDictionary("res://config/typeRequirements.json")
	




func fileToDictionary(filepath):                                                          #parses file of JSON to dictionary
	var fileToDictionaryFile = File.new()
	fileToDictionaryFile.open(filepath,File.READ)
	var test=fileToDictionaryFile.get_as_text()
	var fileToDictionaryJSON = JSON.parse(fileToDictionaryFile.get_as_text())
	fileToDictionaryFile.close()
	
	return fileToDictionaryJSON.result


func getAllJSONTypes(filepath):
	var dir = Directory.new()
	var typesInJSONDir = []
	
	dir.open(filepath)
	dir.list_dir_begin(true,false)
	var fileName = dir.get_next()
	
	while fileName != "":
		typesInJSONDir.append(fileToDictionary(filepath+"/"+fileName))
		fileName = dir.get_next()
	return typesInJSONDir
	




