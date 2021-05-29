
# CLASS Initialices objects of Engines of Cogsmos Framework                          
# CLASS DemocrECTS gets its Groups to order Entities                                 
# CLASS SokraTILES parses its Tilesets and converts them to Entities                 
# CLASS DioJSONes loops through Gamedata and converts all JSON to GameElements       
# CLASS                                                                              
# BOOKMARK[epic=Singleton] Bootstrap                                                 
# CLASS                                                                              
extends Node


func _init() -> void:	
	InitDemocrECTS.new()
	InitSokraTiles.new()
	InitDioJSONes.new()


