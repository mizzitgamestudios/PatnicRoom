extends SokraTiles_Chunk_Animation
class_name Sokratiles_Chunk_Selection


#----- INITIALICE ------------------------------------------------------------##

func _ready():
	.initialice(ENUM.SOKRATILES_LAYER.SELECTION)



#----- FUF ----------------------------------------------------------------------##

func clearLayer():
	var keys = entsOnMap.keys()
	if !entsOnMap.empty():
		for i in entsOnMap.size():
			var currentPos = keys[i] 
			_drawCell(-1, Vector2(keys[i].x,keys[i].y) )
		entsOnMap = {}


func drawCell_quack( textureID:String, mainPos, altPos=0 ):
	if mainPos is Vector2 : mainPos = Vector2(mainPos.x,mainPos.y)
	var pos = checkForVector(mainPos,altPos)
	entsOnMap[pos] = textureID
	_drawCell( textureID,pos )





func drawMouseSelection(pos:Vector2,id):
	drawCell_quack( str(id), Vector2(pos.y+1,pos.x))








