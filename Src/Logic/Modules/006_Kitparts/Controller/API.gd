extends DemocrECTS_Controller


#----- INITIALICE ------------------------------------------------------------##

var _kitPartEntManager : _6_KitpartEntityManager

func _init() -> void:
	_kitPartEntManager = _6_KitpartEntityManager.new("API_6_TileEntityManager", ENUM.MINIMAL_COMP_KITPART_ENT)


	
#----- CREATION --------------------------------------------------------------##

#FUNC returns a second instance of TileEntity                                            
#FUNC usefull for getting Templates to actual usable Tiles                               
#VAR  [C_0_ANY_DESCRIPTION]  [C_1_ANY_IS_WALKABLE]  [C_2_ANY_TEXTURE_ID]  
#VAR  [C_4_ANY_MAGIC_NOISE ]  [C_3_ANY_LAYER ] [C_5_ANY_MATRIX_NOISE] [C_6_TILE_NAME ]   
func contextualEntityGeneration_quack(dict_or_ent):
	var ent = _kitPartEntManager.contextualEntityGeneration_quack(dict_or_ent)
	ent = _kitPartEntManager.convertToSpecificEntity(ent)
	API_017_Atlas.getKitpartsAtlas().addEntity(ent)
	return ent

func secureEntityGeneration_quack(ent,mode:String):
	return _kitPartEntManager.secureEntityGeneration_quack(ent,mode)
