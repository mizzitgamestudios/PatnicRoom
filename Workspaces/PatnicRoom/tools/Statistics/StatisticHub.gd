extends Node
class_name Statistics_Hub





func getStatistics():
	print("CALCULATING STATISTICS...")
	var jsonParse = Util.JSONParser.fileToDictionary("res://tools/RuntimeConfigs/statistics.json")
	print("")
	print("")
	getMDFiles(jsonParse["MD"])
	getJSONFiles(jsonParse["JSON"])
	print("")
	print("")
	print("STATISTICS COMPUTED")
	print("")
	print("")
	




func getMDFiles(config:Dictionary):
	if config["components"]      :    print("> Components Computet");		Statistics_components_MD.calcStats()
	if config["kitparts"]        :    print("> Kitparts Computet");			Statistics_MD_Kitparts.calcStats()
	if config["tilesets"]        :    print("> Tilesets Computet");			Statistics_tileset_MD.calcTileset(API_001_Atlas.TileSetAtlas())
	if config["enum"]            :    print("> Enums Computet");			Statistics_enum_MD.calcStats()
		

	if config["atlas_tile"]      :    print("> Atlas_Tiles Computet");		Statistics_atlas_MD.calcStats (API_001_Atlas.TileAtlas(),          "Tile",       "res://tools/Statistics/output/Atlas_Tile.md"      )
	if config["atlas_static"]    :    print("> Atlas_Statics Computet");	Statistics_atlas_MD.calcStats (API_001_Atlas.InteractableAtlas(),  "Static",     "res://tools/Statistics/output/Atlas_Static.md"    )
	
	if config["atlas_role"]      :    print("> Atlas_Roles Computet");		Statistics_atlas_MD.calcStats (API_001_Atlas.RoleAtlas(),          "Roles",      "res://tools/Statistics/output/Atlas_Role.md"      )
	if config["atlas_race"]      :    print("> Atlas_Race Computet");		Statistics_atlas_MD.calcStats (API_001_Atlas.RaceAtlas(),          "Race",       "res://tools/Statistics/output/Atlas_Race.md"      )
	if config["atlas_specialty"] :    print("> Atlas_Specialty Computet");	Statistics_atlas_MD.calcStats (API_001_Atlas.SpecialtyAtlas(),     "Specialty",  "res://tools/Statistics/output/Atlas_Specialty.md" )
		

func getJSONFiles(config:Dictionary):
	if config["components"]      :    print("> Components Computet");		Statistics_Components_JSON.calcStats()




