extends Node
#//CLASS merges all Components of Modules to one single in SokraTILES.component_Index  
#//CLASS initiates groupmanager for the Organisation of Entities by their Usage        
#//CLASS initiates entityConverter for the deserialication of all GameData             
class_name InitDemocrECTS


func _init():
	DemokrECTS.entityConverter = DemocrECTS_EntityConverter.new()
	

	
	TilesetParser.new()

