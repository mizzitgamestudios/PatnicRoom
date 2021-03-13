extends SokraTiles_Chunk_Animation
class_name Sokratiles_Chunk_Condition


#----- INITIALICE ------------------------------------------------------------##

var layerEntriesOnMap = []

func _ready():
	.initialice(ENUM.SOKRATILES_LAYER.CONDITION)
	Signals.connect("Actor_Turn_Finished",self,"updateMap")



#----- FUF ----------------------------------------------------------------------##

func addLayerEntry(ent,textureID:String):
	layerEntriesOnMap.append( LayerEntry.new(ent,textureID) )
	updateMap()

func removeLayerEntry(ent):
	if layerEntriesOnMap.has(ent):
		var nr = layerEntriesOnMap.find(ent)
		layerEntriesOnMap.remove(nr)



func updateMap():
	.clear()

	for i in layerEntriesOnMap.size():
		var currentLayerEntry = layerEntriesOnMap[i]
		var currentPos        = currentLayerEntry.affectedEnt.pos()

		_drawCell(currentLayerEntry.textureID,currentPos)





class LayerEntry:
	var affectedEnt
	var textureID: String
	var oldPosCache

	func _init(affectedEntPara,textureIDPara):
		affectedEnt = affectedEntPara
		oldPosCache = affectedEnt.pos()
		textureID   = textureIDPara


















