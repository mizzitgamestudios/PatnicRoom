###############################################################################################################################
#                                                                                                                             #
# Klasse:		Filehub Util                                                                                                  #
# description:	converts and autofills DIctionary                                                                             #
#                                                                                                                             #
# data flow:	SokraTiles -> PanicMode -> Actor Layor                                                                        #
#                                                                                                                             #
# often called:	@getListOfFilePathsOfDirectory() with parameter String as Filepath                                            #
#                                                                                                                             #
#                                                                                                                             #
#                                                                                                                             #                                              #
#                                                                                                                             #
###############################################################################################################################

extends Node
class_name JsonParser



########################
# --- Main ----------- #
########################
func fileToDictionary(filepath):                                                          #parses file of JSON to dictionary
	var fileToDictionaryFile = File.new()
	fileToDictionaryFile.open(filepath,File.READ)
	var fileToDictionaryJSON = JSON.parse(fileToDictionaryFile.get_as_text())
	fileToDictionaryFile.close()
	
	return fileToDictionaryJSON.result


func tilesOfTilesetToDictionary(filepath):
	var tileset = fileToDictionary(filepath)
	return tileset["tiles"]
