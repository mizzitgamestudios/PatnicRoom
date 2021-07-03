extends Node
class_name FormFieldAttributes


var inputNode
var inputToString

var componentName:    String
var description:      String

var size:             Vector2
var pos:              Vector2

var nameToShow:       String
var suggestion:       String

var validInputs:      Array
var validType:        String
var dataTypeToString: String

var style:            StyleBoxFlat

var scene:            Node2D


func initialice(dict:Dictionary,scenePara:Node2D,numberofField:int) -> void:
	scene = scenePara
	setByDictionary(dict)
	setFormat(numberofField)


func setFormat(numberofField:int) -> void:
	var width        = Utils.getWidth(validType)
	
	pos              = getPosOfCurrentFormEntry(numberofField)
	style            = Utils.getStyle(validType) 
	size             = Vector2(width, 20)




func setByDictionary(dict:Dictionary):
	description      = dict["description"]
	suggestion       = dict["suggestion"]
	validInputs      = dict["validInputs"]
	validType        = dict["validType"]
	nameToShow       = dict["nameToShow"]
	componentName    = dict["componentName"]
	dataTypeToString = Utils.getDataToString(validType)




func getPosOfCurrentFormEntry(counter:int):
	var pos = Vector2(450,0)
	counter +=1
	
	for i in counter:
		pos.y += 20
		pos.y += 10
		
	return pos
