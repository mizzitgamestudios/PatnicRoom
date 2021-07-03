
# CLASS instanciates Hub for Entity-converters                                        
# CLASS Parses all Tilesets of Tiled and converts them to Entities                    
# CLASS copies interactive Tiles into its own Atlas                                   
# CLASS                                                                              
extends Node
class_name InitDemocrECTS


func _init():
	DemokrECTS._entityConverter = _DemocrECTS_EntityConverter.new()
	TilesetParser.new()
<<<<<<< HEAD
	
=======
	API_001_Atlas.fillInteractableTilesInOwnAtlas()
>>>>>>> 14ed4bc523602584d0fecdfce3fc61f9ee8a2684

