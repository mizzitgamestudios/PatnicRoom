extends TileMap
class_name SokraTiles_Chunk_Basic

var entsOnMap = {}


func _drawWholeLayer() -> void:
	var entsToPars = entsOnMap.values()
	var posOfEnts = entsOnMap.keys()
	
	for i in entsToPars.size():
		
		var currentEnt = instance_from_id(entsToPars[i])
		
		currentEnt.setPos( posOfEnts[i])
		_drawCell(currentEnt.textureID(), posOfEnts[i] )


func _drawCell(id, mainPos, altPos=0):
	if id      is String  : id = self.tile_set.find_tile_by_name(id)

	if mainPos is int     : set_cell(mainPos.x, altPos, id)
	if mainPos is Vector2 : set_cell(mainPos.x, mainPos.y, id)





func checkForVector(mainPos, altPos=0):
	if mainPos is int     :   return Vector2(mainPos,altPos)
	if mainPos is Vector2 :   return mainPos


func stopAtDefaultTilemapSize(pos:Vector2):
	if pos.x > 99: pos.x = 99;   if pos.x < 0: pos.x = 0
	if pos.y > 99: pos.y = 99;   if pos.y < 0: pos.y = 0
	return pos


func convertForPivot(typeEnum:int,pos:Vector2):
	match typeEnum:
		ENUM.TYPES_ON_MAP.TILE     : return Vector2(pos.x,pos.y)
		ENUM.TYPES_ON_MAP.ACTOR    : return Vector2(pos.x,pos.y)
		ENUM.TYPES_ON_MAP.INTERACT : return Vector2(pos.y,pos.x)
		ENUM.TYPES_ON_MAP.MARKER   : return Vector2(pos.x,pos.y)
		ENUM.TYPES_ON_MAP.PLAYER   : return Vector2(pos.x,pos.y)

