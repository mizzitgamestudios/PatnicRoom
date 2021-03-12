extends Node
class_name SokraTILEs_TilemapManager



#----- OPEN FUNKTIONS --------------------------------------------------------##

var tilesetAtlas = API_017_Atlas.TileSetAtlas()
var tilesetOrder = []
var dictOfMap    = {}


func createTilemap(filepathToMap:String) -> void:
	dictOfMap          = Util.JSONParser.fileToDictionary(filepathToMap)
	tilesetOrder       = getTilesetIDsInMap(dictOfMap["tilesets"])
	
	SokraTiles.setNewTilemap( parseWholeMap() )
	
	

#----- MAP FORMATER ----------------------------------------------------------##

#FUNC loops through the eight Layers of map and parses their tiles                   
#FUNC !!WARNING!! layers are hardcoded by their sequenz and quantity,size can differ 
#VAR MType as in [MEAT],[MAGIC],[MATRIX],[ACTOR],[PLAYER]                            
func parseWholeMap(): 
	var allTilesetLayers = []
	for mType in 5:

		if isActorLayer(mType) :
			allTilesetLayers.append( parseLayer(true))
		

		elif isPlayerLayer(mType):
			allTilesetLayers.append( findPlayer(dictOfMap["layers"][4]["data"]) )


		else:
			for floor_or_interact in 2:
				var currentLayer = getCurrentLayer(mType,floor_or_interact)
				var formatedMap  = parseLayer(false,currentLayer)
				allTilesetLayers.append( formatedMap )

	return allTilesetLayers

 
#FUNC !	!                                             
#FUNC parseLayer(true) for 0 at every Tile                     
#FUNC parseLayer(false,layerVar) for inserting LayerVars Tile  
func parseLayer(emptyMode:bool, layer:Array=[]):
	var returnDict = {}

	var size = sqrt( layer.size() )
	if emptyMode: size = 100
	var twoD = {}

	for x in size:
		twoD[x] = {}
		for y in size:
		
			if    emptyMode: twoD[x][y] = 0
			
			elif !emptyMode: 
				twoD[x][y] = layer[x*100+y]
				
			if isNotCurrentTileZero(twoD[x][y]):
				
				var ent = convertDynamicNrToEntity(twoD[x][y])
				ent.position = Vector2(y,x)
				returnDict[Vector2(y,x)] = ent.get_instance_id()
		
	return returnDict



func findPlayer(layer:Array=[]):
	var size = sqrt( layer.size() )
	var twoD = {}

	for x in size:
		twoD[x] = {}
		for y in size:

			if layer[x*100+y] != 0:
				API_011_Player.currentChar.position = Vector2(y,x)


#----- TILE INSERTER ---------------------------------------------------------##

#FUNC looks up the Tilenumber in Master-Atlas by Substracting overlayed Tilesets             
#FUNC returns  [TileEntity]  or  [InteractableEntity]                                        
#VAR tileNrDynamic: Tilemap specific Order of Tilesets by neccessacity and initial placement 
func convertDynamicNrToEntity(tileNrDynamic:int):
	var setNrDynamic = int(tileNrDynamic / 256)
	var dynamicStartTileNr = getRootNrOfTileset(setNrDynamic)

	tileNrDynamic -= dynamicStartTileNr
	
	return getTileEntity(tileNrDynamic,setNrDynamic)


#FUNC loops through Master-Atlas and compares TileNr with MasterNr               
#FUNC returns  [TileEntity]  or  [InteractableEntity]                            
#VAR tileNrDynamic: same as in Master,comparable                                     
#VAR setNrDynamic: is needed for zeroing dynamic tileset on Master tileset       
func getTileEntity(tileNrDynamic:int,setNrDynamic:int):
	var setInTilesetMaster  = tilesetAtlas[convertTilesetMapNrToAtlasNr(setNrDynamic)]

	for i in setInTilesetMaster.size():

		var currentEnt  	 = setInTilesetMaster.values()[i]
		var tileNrStatic    = currentEnt.staticTilesetNR()
		
		if tileNrStatic == tileNrDynamic:
			if   currentEnt is TileEntity: 		return API_000_BasicTilesAtlas.contextualEntityGeneration_quack(currentEnt)
			elif currentEnt is InteractEntity: 	return API_015_StaticInteractable.contextualEntityGeneration_quack(currentEnt)



#----- GETTER / HELPER -------------------------------------------------------##

#FUNC -1 at return because of arrays                                            
func convertTilesetMapNrToAtlasNr(tilesetNrMap:int):
	var tilesetNrAtlas = tilesetOrder[tilesetNrMap]
	var allTilesets    = tilesetAtlas.keys()
	return allTilesets[tilesetNrAtlas-1]


#FUNC cuts Filepaths down their ID at the beginning of their  name and returns them as Array 
#FUNC !NOTE! Order of Tilesets is relevant for the right insertion of Tiles,dont mix them up 
func getTilesetIDsInMap(filepath: Array) -> Array:
	for i in filepath.size():
		
		var stringOfTilepath = filepath[i]["source"]
		var tileSetFile = stringOfTilepath.split("JSON/")[1]
		var tilesetName = tileSetFile.split(".json")[0]
		var number = int(tilesetName.split("_")[0])
		
		tilesetOrder.append(number)

	return tilesetOrder



func isActorLayer(i:int): return i == 0
func isPlayerLayer(i:int): return i == 4
func isNotCurrentTileZero(i:int): return str(i) != str(0) 

func getCurrentLayer(mType:int,pairNr:int): 			return dictOfMap["layers"]	 [mType]["layers"]	[pairNr]["data"]
func getRootNrOfTileset(dynamicTilesetNr:int): 			return dictOfMap["tilesets"] [dynamicTilesetNr] ["firstgid"]
