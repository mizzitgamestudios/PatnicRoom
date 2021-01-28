extends Node
class_name Helpers

const MEDIA_PATH = "res://Media/"

func getMediaPath():
	return MEDIA_PATH

func getGuiPath() -> String:
	return getMediaPath() + "GUI/"


func getKitPath(fileName : String = "") -> String:
	return getMediaPath() + "KitSymbols/" + fileName
 
