extends Node2D


var statsNameArray : Array = []
var statsArray     : Array = []
var root

func initialice(ent,pos,rootPara):

	root = rootPara
	fillArrays(ent)

	var baseNode = .get_node("Stat")
	var nameNode = baseNode.get_node("name of Stat")
	var statNode = baseNode.get_node("Stat")
	
	for i in statsArray.size():
		var currentName = nameNode.get_node("entry"+str(i))
		var currentStat = statNode.get_node("entry"+str(i))
		
		currentName.bbcode_text = str(statsNameArray[i])
		currentStat.bbcode_text = str(statsArray[i])
	
	self.visible = true
	self.global_position = pos



func fillArrays(ent):
	if   ent is TileEntity     : fillByTile(ent)
	elif ent is ActorEntity    : fillByActor(ent)
	elif ent is InteractEntity : fillByInteract(ent)


func fillByTile(ent:TileEntity):
	statsNameArray.append("Name:")
	statsArray.append( ent.tileName() )

	statsNameArray.append("description:")
	statsArray.append( ent.description() )

	statsNameArray.append("Walkable:")
	statsArray.append( ent.isWalkable() )


func fillByActor(ent:ActorEntity):
	statsNameArray.append("Name:")
	statsArray.append( ent.synonym() )

	statsNameArray.append("description:")
	statsArray.append( ent.tileName() )

	statsNameArray.append("Hitpoints:")
	statsArray.append(ent.hitpoints())


func fillByInteract(ent:InteractEntity):
	statsNameArray.append("Name:")
	statsArray.append( ent.tileName() )

	statsNameArray.append("description:")
	statsArray.append( ent.description() )
	
	statsNameArray.append("Walkable:")
	statsArray.append( ent.isWalkable() )



func _input(event) -> void:
	if !Util.Nodes.isMouseOnNode(self.get_node("panel")):
		self.queue_free()
