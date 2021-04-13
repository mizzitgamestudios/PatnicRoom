extends SokraTiles_Chunk_Animation
class_name Sokratiles_Chunk_Condition


#----- INITIALICE ------------------------------------------------------------##

var layerEntriesOnMap = []

func _ready():
	.initialice(ENUM.SOKRATILES_LAYER.CONDITION)
	Signals.connect("Actor_Turn_Finished",self,"updateMap")



#----- FUF ----------------------------------------------------------------------##

func addLayerEntry(ent,condClassName,textureID:String):
	layerEntriesOnMap.append( LayerEntry.new(ent,condClassName,textureID) )
	updateMap()

func removeLayerEntry(ent):
	if layerEntriesOnMap.has(ent):
		var nr = layerEntriesOnMap.find(ent)
		layerEntriesOnMap.remove(nr)



func updateMap():
	.clear()
	var toRemove = []
	
	for i in layerEntriesOnMap.size():
		var currentLayerEntry = layerEntriesOnMap[i]
		
		if isNullReference(currentLayerEntry): 
			toRemove.append(i)
			
		else:
			var currentPos = currentLayerEntry.affectedEnt.pos()
			_drawCell(currentLayerEntry.textureID,currentPos)
	
	
	for i in toRemove.size():
		layerEntriesOnMap.remove(toRemove[i])


func isNullReference(currentLayerEntry:LayerEntry):
	return !is_instance_valid(currentLayerEntry.conditionInstance) or !is_instance_valid(currentLayerEntry.affectedEnt)


class LayerEntry:
	var affectedEnt
	var textureID: String
	var oldPosCache
	var conditionInstance

	func _init(affectedEntPara,condClassName,textureIDPara):
		conditionInstance = affectedEntPara.dictOfConds[condClassName]
		affectedEnt = affectedEntPara
		oldPosCache = affectedEnt.pos()
		textureID   = textureIDPara


















