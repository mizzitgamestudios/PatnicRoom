extends Node
class_name FileHub

func _init():
	pass;
	
	
var dir = Directory.new()
func getListOfFilePathsOfDirectory(path):                                      #Filewalker for .json-files
	var filesArray = []
	
	dir.open(path)
	dir.list_dir_begin()

	while true:
		var file = dir.get_next()                                               
		if file == "":
			break                                                               #goes out of loop when no next file left
		
		elif not file.begins_with(".") and not file.ends_with(".import"):        #exludes fileToDictionarysaves and empty files
			filesArray.append(path+"/"+file)
			
	dir.list_dir_end()
	return filesArray

func getNextFile(path):
	dir.open(path)
	dir.list_dir_begin(true,false)
	var file =dir.get_next()
	return file
