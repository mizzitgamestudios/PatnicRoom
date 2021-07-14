extends Node

var saveInStable



static func getFilepathToSave(nameOfContent):
	var prefix = Utils.componentsToLoad["filename prefix"]
	return "Personal/"+prefix+nameOfContent+".json"




