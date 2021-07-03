extends Node
class_name Statistics_Hub


<<<<<<< HEAD
# ----- META DATA ------------------------------------------------------------ ##

enum STATISTICS_TYPE { DEFAULT , ATLAS }

var statisticsMeta = {

	STATISTICS_TYPE.DEFAULT : [
		{  "TYPE":"DEFAULT"  ,  "NAME":"components"     ,   "CLASS":Statistics_components_MD               },
		{  "TYPE":"DEFAULT"  ,  "NAME":"kitparts"       ,   "CLASS":Statistics_MD_Kitparts                 },
		{  "TYPE":"DEFAULT"  ,  "NAME":"tilesets"       ,   "CLASS":Statistics_tileset_MD                  },
		{  "TYPE":"DEFAULT"  ,  "NAME":"enum"           ,   "CLASS":Statistics_enum_MD                     },
		{  "TYPE":"DEFAULT"  ,  "NAME":"Tiles"           ,  "CLASS":Statistics_Tiles_MD                    },
		{  "TYPE":"DEFAULT"  ,  "NAME":"Syntax Effect"  ,   "CLASS":Statistics_effectsSyntax_MD            }
	],

	STATISTICS_TYPE.ATLAS : [
		{  "TYPE":"ATLAS"    ,  "NAME":"Tile"           ,  "ATLAS_DICT":API_001_Atlas.TileAtlas()          },
		{  "TYPE":"ATLAS"    ,  "NAME":"Interactables"  ,  "ATLAS_DICT":API_001_Atlas.InteractableAtlas()  },
		
		{  "TYPE":"ATLAS"    ,  "NAME":"Role"           ,  "ATLAS_DICT":API_001_Atlas.RoleAtlas()          },
		{  "TYPE":"ATLAS"    ,  "NAME":"Race"           ,  "ATLAS_DICT":API_001_Atlas.RaceAtlas()          },
		{  "TYPE":"ATLAS"    ,  "NAME":"Specialty"      ,  "ATLAS_DICT":API_001_Atlas.SpecialtyAtlas()     },
	]



}



# ----- MAIN ----------------------------------------------------------------- ##
=======

>>>>>>> 14ed4bc523602584d0fecdfce3fc61f9ee8a2684


func getStatistics():
	print("CALCULATING STATISTICS...")
<<<<<<< HEAD

	print("MARKDOWNS")
	getMDFiles()

	print("JSONS")
	getJSONFiles()

	print("STATISTICS COMPUTED")
	
	


func getMDFiles():
	for i in statisticsMeta.size():
		var currentEntries = getCurrentEntries(i)
		var statTypeClass  = getTypeClass(i)
		
		for entry in currentEntries:
			var toCompute = statTypeClass.new(entry)
			toCompute.printStatus()
			toCompute.run()



func getJSONFiles():
	print(">  Components Computet")        ;		Statistics_Components_JSON.calcStats()
	#print(">  Syntax Of Effect Computet")  ;		Statistics_effectsSyntax_JSON.calcStats()



# ----- HELPER --------------------------------------------------------------- ##


func getCurrentEntries(itteration): return statisticsMeta.values()[itteration]

func getTypeClass(itteration:int):
	match statisticsMeta.keys()[itteration]:
		STATISTICS_TYPE.DEFAULT : return DefaultStatistic
		STATISTICS_TYPE.ATLAS   : return AtlasStatistics



# ----- STATS CLASSES -------------------------------------------------------- ##


#>>> DEFAULT <<<#
class DefaultStatistic:
	var type:String  ;  var categoryName:String  ;  var calculatorReference

	func printStatus() : print(">  "+categoryName) 
	func run()         : calculatorReference.calcStats()

	func _init(toCalc:Dictionary) -> void:
		type                = toCalc["TYPE"]
		categoryName        = toCalc["NAME"]
		calculatorReference = toCalc["CLASS"]




#>>> ATLAS <<<#
class AtlasStatistics:
	var type:String           ;  var categoryName:String    ;  var calculatorReference
	var atlasDict:Dictionary  ;  var filepathToSave:String
	
	func printStatus() : print(">  "+categoryName) 
	func run()         : calculatorReference.calcStats(atlasDict, categoryName, filepathToSave)
	
	func _init(toCalc:Dictionary):
		type                = toCalc["TYPE"]
		categoryName        = toCalc["NAME"]
		calculatorReference = Statistics_atlas_MD
		
		atlasDict           = toCalc["ATLAS_DICT"]
		filepathToSave      = "res://tools/Statistics/output/Atlas"+categoryName+".md"










=======
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
>>>>>>> 14ed4bc523602584d0fecdfce3fc61f9ee8a2684




