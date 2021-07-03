extends DemocrECTS_Controller


 
# DOCS     https://mizzitgamestudios.github.io/mkDocs/site/Atlas/Atlas_Components

# BOOKMARK[epic=Modules] 001_Atlas                                               
var _interactables
var _tiles
var _kitparts
var _role
var _race
var _specialty
var _actorTemplate :_17_Actor_Template

# REVIEW dkdpi
func _init():
	_tiles           = _17_Tiles.new()
	_kitparts        = _17_Kitparts.new()
	_role            = _17_Role.new()
	_race            = _17_Race.new()
	_specialty       = _17_Specialty.new()
	_interactables   = _17_Interactables.new()
	_actorTemplate   = _17_Actor_Template.new()




#>>> TILE_ENTITY <<<#
func TileAtlas():                           return _tiles.atlas_Entry
func TileSetAtlas():                        return _tiles.atlas_Tilesets

func getTileByTextureID(textureID:String):  
	var cache = _tiles.atlas_Entry[textureID]
	return DemokrECTS.initialiceNewEntry(cache)

func addTileSet(tileSetname,dict):                           return _tiles.createTileset(tileSetname,dict)
 
#>>> INTERACT_ENTITY <<<#
func InteractableAtlas():               return _interactables.atlas_Entry



#>>> KITPART_ENTITY <<<#
func KitParts():return _kitparts
func sortKitpartsAtlas():_kitparts.sortEntries()
func getKitByDrirectName(name:String): return _kitparts.getDirectByAtlas(name)
func getKitGroup(name_enum_KitGroup):         return _kitparts.getKitGroup(name_enum_KitGroup)



func ActorTemplate():       return _actorTemplate
func ActorTemplateAtlas():  return _actorTemplate.atlas_Entry

#>>> ACTOR_ROLES       <<<#
func Role():           return _role
func RoleAtlas():      return _role.atlas_Entry

#>>> ACTOR_RACES       <<<#
func Race():           return _race
func RaceAtlas():      return _race.atlas_Entry
	
#>>> ACTOR_SPECIALTY   <<<#
func SpecialtyAtlas():  return _specialty.atlas_Entry




