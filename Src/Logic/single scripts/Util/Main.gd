extends Node

var JSONParser : JsonParser
var RNG
var Filehub
var DictionaryUtils
var Nodes
var helpers


func _init():
	RNG = RNGClass.new()
	JSONParser = JsonParser.new()
	Filehub = FileHub.new()
	DictionaryUtils = DictionaryUtil.new()
	Nodes = NodesManager.new()
	helpers = Helpers.new()
