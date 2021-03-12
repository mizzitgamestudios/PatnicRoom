extends DemocrECTS_Controller
#//CLASS                                         


var tileAtlas       : _17_Tiles
var _tileEntManager : _0_TileEntManager



func _init() -> void:
	self.name       = "API_000_BasicTileAtlas"

	_tileEntManager = _0_TileEntManager.new("API_1_TileEntityManager", ENUM.MINIMAL_COMP_TILE_ENT)
	
func _ready() -> void:
	tileAtlas =  API_017_Atlas.Tile()



#BOOKMARK[epic=Entities_Process] Tile: API -> EntMan                            
#----- CONSTRUCTORS ----------------------------------------------------------##

#FUNC returns a second instance of TileEntity                                            
#FUNC usefull for getting Templates to actual usable Tiles                               
#VAR  [C_0_ANY_DESCRIPTION]  [C_1_ANY_IS_WALKABLE]  [C_2_ANY_TEXTURE_ID]  
#VAR  [C_4_ANY_MAGIC_NOISE ]  [C_3_ANY_LAYER ] [C_5_ANY_MATRIX_NOISE] [C_6_TILE_NAME ]   
func contextualEntityGeneration_quack(dict_or_ent):
	return _tileEntManager.contextualEntityGeneration_quack(dict_or_ent)



#----- SETTER ----------------------------------------------------------------##

func addAttributesToDictOfComps(ent:TileEntity):
	_tileEntManager.addAttributesToDictOfComps(ent)


