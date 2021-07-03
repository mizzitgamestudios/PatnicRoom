extends DemocrECTS_Controller


 
# DOCS     https://mizzitgamestudios.github.io/mkDocs/site/Atlas/Atlas_Components

# BOOKMARK[epic=Modules] 001_Atlas                                               
var _interactables
var _tiles
var _kitparts
var _role
var _race
var _specialty

# REVIEW dkdpi
func _init():
	_interactables   = _17_Interactables.new()
	_tiles           = _17_Tiles.new()
	_kitparts        = _17_Kitparts.new()
	_role            = _17_Role.new()
	_race            = _17_Race.new()
	_specialty       = _17_Specialty.new()




# ---- TILE_ENTITY ---- #
func TileAtlas():                           return _tiles.atlas_Entry
func TileSetAtlas():                        return _tiles.atlas_Tilesets

func getTileByTextureID(textureID:String):  return _tiles.atlas_Entry[textureID]

func addTileSet(tileSetname,dict):                           return _tiles.createTileset(tileSetname,dict)
 
# ---- INTERACT_ENTITY ---- #
func InteractableAtlas():               return _interactables.atlas_Entry
func fillInteractableTilesInOwnAtlas(): _interactables.fillInteractableTilesInOwnAtlas()


# ---- KITPART_ENTITY ---- #
func KitParts():return _kitparts
func sortKitpartsAtlas():_kitparts.sortEntries()
func getKitByDrirectName(name:String): return _kitparts.getDirectByAtlas(name)
func getKitGroup(name:String):         return _kitparts.allBasekitGroups[name.to_lower()]



# ---- ROLES ---- #
func RoleAtlas():      return _role.atlas_Entry
# ---- RACES ---- #
func RaceAtlas():      return _race.atlas_Entry
# ---- SPECIALTY ---- #
func SpecialtyAtlas():  return _specialty.atlas_Entry


