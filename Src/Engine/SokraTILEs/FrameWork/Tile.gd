extends Node
class_name SokraTILEs_TileManager

const COMMON_TILES={
	"PLAYER_TOKEN":"General_0_5",
	"PANIC_ROOM":"General_2_0",
}

func parseDictToTileEntity(tiles):
	var entCache 
	var tilesOfTilesetsWithAttributes = {}
	var idcache
	
		
	for tile in tiles:	#for each Tile of Tileset
		var propertiesCache={}
		for i in tile["properties"].size():			#for each attribute of tile (in tileset)
				
			var property = tile ["properties"] [i]
				
			var porpertyName = ( str(property["name"]) )
			var porpertyValue = property["value"]


			propertiesCache[porpertyName]=porpertyValue
			_cacheTileNrAndID(idcache,tile["id"])
			
		
		entCache = API_000_BasicTilesAtlas.createNewTileByDict(propertiesCache)
		tilesOfTilesetsWithAttributes[entCache.textureID()] = entCache
	return tilesOfTilesetsWithAttributes




func getTileNrAndIDOfLocalCache():
	var dict={}
	var saniticedNr
	for i in tileIDInSetCache.size():
		var strOfNr=str(int(tileNrInSetCache[i]))
		if strOfNr.length()<3:
			saniticedNr =  saniticeTileNr(strOfNr)
		else:
			saniticedNr = str(int(tileNrInSetCache[i]))
		dict[saniticedNr]=tileIDInSetCache[i]
	tileIDInSetCache.clear()
	tileNrInSetCache.clear()
	return dict
	




var tileNrToString
var tilesetNr
func getStaticTileNrToString(tileNr):
	var boolean = true
	var counter = 0
	tileNr = int(tileNr)

	
	while boolean:
		if tileNr>256:
			counter = counter+1
			tileNr = tileNr-256
		else:
			boolean = false
			tileNrToString = saniticeTileNr(tileNr-1)
			tilesetNr = counter
			return tileNrToString

func getStaticTileNr(tileNr):
	var boolean = true
	var counter = 0
	tileNr = int(tileNr)

	
	while boolean:
		if tileNr>256:
			counter = counter+1
			tileNr = tileNr-256
		else:
			boolean = false
			tileNrToString = saniticeTileNr(tileNr-1)
			tilesetNr = counter
			return counter

func saniticeTileNr(nr):
	if str(nr).length()<=3:
		var neededLength = 3-str(nr).length()
		var string=""
		for j in neededLength:
			string=str(0)+str(string)
		return string+str(nr)

func getTileNrInTileSet(tileNr:int):
	var boolean = true
	var counter = 0
	
	while boolean:
		if tileNr>256:
			counter = counter+1
			tileNr = tileNr-256
		else:
			boolean = false
			tilesetNr = counter
			return tileNr-1





func getEntByDynamic(dynamicTileNr:int,dynamicTilesetOrder:PoolStringArray) -> TileEntity:
	
	var dynamicTilesetNr = getStaticTileNr(dynamicTileNr)
	
	var staticTileset = dynamicTilesetOrder[dynamicTilesetNr] 
	var tileNrInSet = getTileNrInTileSet( int(dynamicTileNr) )
	
	var textureID=getTextureIdByTileNrInSet( int(tileNrInSet) ,staticTileset)
	
	return SokraTiles.Atlas_tileset_Meta[staticTileset]["ReferenceStringToEnt"][textureID]

func getEntByStatic(staticTileNr:int,dynamicTilesetOrder:PoolStringArray) -> TileEntity:

		var dynamicTilesetNr = getStaticTileNrToString(staticTileNr)
		var staticTileset = dynamicTilesetOrder[dynamicTilesetNr] 
		
		var tileNrInSet = getTileNrInTileSet( int(staticTileNr) )
		
		var textureID=getTextureIdByTileNrInSet( int(tileNrInSet), staticTileset)
		
		return SokraTiles.Atlas_tileset_Meta[staticTileset]["ReferenceStringToEnt"][textureID]

		






func getTextureIdByTileNrInSet(tileNr:int,tileset:String):
	var tilesetarr=tileset.split("_")

	var tilesetPart=tilesetarr[1]

	var rowPart = getRow(tileNr)
	var collumPart = getCollum(tileNr,rowPart)

	return tilesetPart+"_"+str(rowPart)+"_"+str(collumPart)


func getCollum(tileNr:int,row:int):
	var flooredNumber = row*16
	var rest = tileNr - flooredNumber
	return rest

func getRow(tileNrInSet:int):
	var counter=0
	while true:
		if tileNrInSet<16:
			return counter
		else:
			tileNrInSet -= 16
			counter += 1



var tileNrInSetCache=[]
var tileIDInSetCache=[]
func _cacheTileNrAndID(ID,TileNr):
	tileNrInSetCache.append(TileNr)
	tileIDInSetCache.append(ID)
