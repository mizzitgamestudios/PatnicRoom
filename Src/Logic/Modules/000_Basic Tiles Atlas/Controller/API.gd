extends DemocrECTS_Controller


########################
# --- Variables ------ #
########################
var validator
var logger
var tileEntManager
var atlasTiles: Dictionary = {}



########################
# --- Init ----------- #
########################
func _init() -> void:
	self.name = "API_000_BasicTileAtlas"
	atlasTiles = self._dict_component_index

	validator = _00_00_Validator.new()
	logger = _00_00_Logger.new()
	tileEntManager = TileEntManager.new()

########################
# --- Functions ------ #
########################
func createNewTileByDict(dict:Dictionary) -> TileEntity:
	if validator.checkDictForTileGeneration(dict):
		
		var ent: TileEntity = tileEntManager.constructEnt(dict)
		atlasTiles[ent.textureID()] = ent
		return ent
	
	return null

func getIndexedTile(_textureIdOfTile:String) -> TileEntity:
	if validator.checkIsSearchedStringInAtlas(_textureIdOfTile):
		return atlasTiles[_textureIdOfTile]
	else:
		return null
