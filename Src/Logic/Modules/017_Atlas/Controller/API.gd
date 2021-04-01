extends DemocrECTS_Controller


var _interactables
var _tiles
var _kitparts
var _role
var _race
var _specialty


func _init():
	_interactables = _17_Interactables.new()
	_tiles = _17_Tiles.new()
	_kitparts = _17_Kitparts.new()
	_role = _17_Role.new()
	_race = _17_Race.new()
	_specialty = _17_Specialty.new()



# ---- TILE_ENTITY ---- #
func Tile():
	return _tiles
func TileAtlas():
	return _tiles.atlas_TextureID
func TileSetAtlas():
	return _tiles.atlas_Tilesets

func getTileByTextureID(textureID:String):
	return _tiles.atlas_Entry[textureID]



# ---- INTERACT_ENTITY ---- #
func getInteractablesAtlas():
	return _interactables



# ---- KITPART_ENTITY ---- #
func getKitpartsAtlas():
	return _kitparts
func sortKitpartsAtlas():
	_kitparts.sortEntries()
func getKitByDrirectName(name:String):
	return _kitparts.getDirectByAtlas(name)
func getKitGroup(name:String):
	return _kitparts.allBasekitGroups[name.to_lower()]



# ---- ROLES ---- #
func getRoles():
	return _role

# ---- RACES ---- #
func getRaces():
	return _race

# ---- SPECIALTY ---- #
func getSpecialty():
	return _specialty


