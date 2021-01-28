extends Node
class_name SokraTILEs_LayerManager

var stringArrayToItterateAllLayer = ["actors","pc","Meat ground","Meat interactables","Matrix ground","Matrix interactables","Magic ground","Magic interactables"]

func initLayeringOfMap(tilemap):
	var layers = {}
	var spaces = [1,2,3]
	
	var space = tilemap["layers"]
	for i in spaces.size():
		var currentSpace = space[spaces[i]]
		
		var spaceName = currentSpace["name"]
		
		var layersOfSPace = getLayersOfSpace(currentSpace["layers"])
		
		layers[spaceName] = layersOfSPace
		
	layers ["universal actors"]=space[0]["data"]
	layers ["PC"]=space[4]["data"]
	
	return layers

func clearLayer(layer):
	for i in layer.size():
		for j in layer[i].size():
			layer[i][j] = -1

func getLayersOfSpace(Space):
	var arr=[]
	for i in Space.size():
		arr.append(Space[i]["data"])
	return arr



func getLayer(string:String) -> Dictionary:
	var layer = SokraTiles.tilemap["layers"]
	var returnLayer
	
	match string:
		"actors":
			returnLayer = layer["universal actors"]
		"pc":
			returnLayer = layer["PC"]
			
		"Matrix ground":
			returnLayer = layer["Matrix"][0]
		"Matrix interactables":
			returnLayer = layer["Matrix"][1]
			
		"Meat ground":
			returnLayer = layer["Meat"][0]
		"Meat interactables":
			returnLayer = layer["Meat"][1]
			
		"Magic ground":
			returnLayer = layer["Magic"][0]
		"Magic interactables":
			returnLayer = layer["Magic"][1]
	
	return returnLayer



func updateParsedLayers(layerArray):
	var tilemap = SokraTiles.tilemap
	var spaceArray
	var temp
	
	var layers={}
	
	layers["universal actors"] = layerArray[0]
	layers["PC"] = layerArray[1]
	
	spaceArray=[stringArrayToItterateAllLayer[2], stringArrayToItterateAllLayer[3]]
	temp=[layerArray[2],layerArray[3]]
	layers["Meat"] = temp
	
	spaceArray=[stringArrayToItterateAllLayer[4], stringArrayToItterateAllLayer[5]]
	temp=[layerArray[4],layerArray[5]]
	layers["Matrix"] = temp
	
	spaceArray=[stringArrayToItterateAllLayer[6], stringArrayToItterateAllLayer[7]]
	temp=[layerArray[6],layerArray[7]]
	layers["Magic"] = temp
	
	return layers



