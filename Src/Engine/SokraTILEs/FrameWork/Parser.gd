extends Node
class_name SokraTILEs_TilemapParser

################################################################################
##  --- Main ---                                                              ##
################################################################################

func prepareTilemap(mode,tilemap):
	var layerOrder = SokraTiles.layerManager.stringArrayToItterateAllLayer
	var layersArrayToReturn = []
	
	for i in layerOrder.size():
		var currentLayerToParse = SokraTiles.layerManager.getLayer(layerOrder[i])
		
		
		if mode=="parse1D2D":
			layersArrayToReturn.append( parse1DTo2D(currentLayerToParse,i) )
		
		elif mode=="indexTilemap":
			layersArrayToReturn.append( indexTilemap(currentLayerToParse,tilemap) )
			
	
	return SokraTiles.layerManager.updateParsedLayers(layersArrayToReturn)



################################################################################
##  --- Subfunctions ---                                                      ##
################################################################################

var playerPos
func parse1DTo2D(layer,i):
	if isActorLayer(i):
		return parseEmptyLayer()
	
	var twoD = {}
	for x in 100:
		var test =[]
		twoD[x] = {}
		for y in 100:
			
			var currentTileIdInt = layer[x*100+y]
			
			if !currentTileIdInt==null:
				twoD[x][y] = currentTileIdInt
			else:
				twoD[x][y] = 300
	return twoD


func indexTilemap(layers,tilemap):
	var layerOfEntTiles={}
	var tilesetMeta = SokraTiles.Atlas_tileset_Meta
	var tilemanager = SokraTiles.tilemanager
	var dynamicTilesetOrder = tilemap["tilesets"]
	
	for x in 100:
		layerOfEntTiles[x]={}
		for y in 100:
			
			if !layers[x][y]==null:
				var tileNr = layers[x][y]	# x is TileNr of Tileset and y is number of Tileset in list in Tilemap
				if !tileNr==0 and !tileNr==-1:
					
					var ent = tilemanager.getEntByDynamic(tileNr,dynamicTilesetOrder)
					var instancedEnt=ent.deepCopy()
					layerOfEntTiles[x][y] = instancedEnt
					
				else:
					layerOfEntTiles[x][y] = -1
	return layerOfEntTiles




func getTextureToStringDict(layerToParse:Dictionary):
	var twoD = {}
	for x in 100:
		twoD[x] = {}
		for y in 100:
			var currentEnt = layerToParse[x][y]
			if str(currentEnt) != str(-1):
				var textureStr:String = currentEnt.textureID()
				twoD[x][y] = textureStr
			else:
				twoD[x][y] = -1
	return twoD



################################################################################
##  --- Helpers ---                                                           ##
################################################################################

func parseEmptyLayer():
	var twoD = {}
	for x in 100:
		twoD[x] = {}
		for y in 100:
			twoD[x][y]=-1
	return twoD



################################################################################
##  --- Virtual ---                                                           ##
################################################################################

func debugStop(debugX,debugY,x,y,layerEntOfTiles):
	if debugX==x:
		if debugY==y:
			var test = layerEntOfTiles[debugX][99]
			print("DEBUG!: "+str(layerEntOfTiles[debugX][99]))


func isActorLayer(i:int) -> bool:
	return i == 0


