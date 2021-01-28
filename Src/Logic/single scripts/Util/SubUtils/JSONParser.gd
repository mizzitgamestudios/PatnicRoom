extends Node
class_name JsonParser


func fileToDictionary(filepath):                                                          #parses file of JSON to dictionary
	var fileToDictionaryFile = File.new()
	fileToDictionaryFile.open(filepath,File.READ)
	var fileToDictionaryJSON = JSON.parse(fileToDictionaryFile.get_as_text())
	fileToDictionaryFile.close()
	
	return fileToDictionaryJSON.result




func tilesOfTilesetToDictionary(filepath):
	var tileset = fileToDictionary(filepath)
	return tileset["tiles"]
