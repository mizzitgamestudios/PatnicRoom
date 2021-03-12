extends Node
#//CLASS Initialices objects of Engines of Cogsmos Framework (therefore Singleton)  
#//CLASS DemocrECTS gets its Groups to order Entities                               
#//CLASS SokraTILES parses its Tilesets and converts them to Entities               
#//CLASS DioJSONes loops through Gamedata and converts all JSON to GameElements     


func _init() -> void:	
	InitDemocrECTS.new()
	InitSokraTiles.new()
	InitDioJSONes.new()


