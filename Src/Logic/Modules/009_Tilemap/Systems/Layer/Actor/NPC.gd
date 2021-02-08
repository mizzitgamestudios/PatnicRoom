extends SokraTiles_Chunk
class_name SokraTiles_Chunk_NPC

################################################################################
##  --- Init ---                                                              ##
################################################################################


func _ready() -> void:
	API_007_ProcgenActor.generateByJSONinTools()
	var actorsOnMap = SokraTiles.Actors_on_map
	
	var actorValue = actorsOnMap.values() 
	for i in actorsOnMap.size():
		var actor = actorValue[i]
		self.setCellByTextureID(actor.getPosX(),actor.getPosY(),actor.textureID())
	
	API_012_Behavior.actorLayer = self
	API_009_Tilemap.actorLayer = self
	


func clearTextureOfcurrentPos(ent:ActorEntity):
	set_cell(ent.getPosX(),ent.getPosY(),-1)
