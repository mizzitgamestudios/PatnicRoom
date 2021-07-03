
# CLASS instanciates Hub for Entity-converters                                        
# CLASS Parses all Tilesets of Tiled and converts them to Entities                    
# CLASS copies interactive Tiles into its own Atlas                                   
# CLASS                                                                              
extends Node
class_name InitDemocrECTS


func _init():
	DemokrECTS._entityConverter = _DemocrECTS_EntityConverter.new()
	TilesetParser.new()
	

