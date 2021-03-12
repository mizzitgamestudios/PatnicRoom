#extends Component
#class_name I_1_AUTOMATIC_C53_CHANGE_BY_54
#
#var value = []
#var origin:Vector2
#var isActive:bool
#
#func _init(valuePara):
#	Signals.connect("ACTOR_OR_PLAYER_NEXT_TO_TILE", self, "changeTileOn")
#	Signals.connect("Player_Turn_Finished", self, "checkIfOn")
#
#	name = "I_1_AUTOMATIC_C53_CHANGE_BY_54"
#	origin = valuePara
#	isActive = false
#
#	value.append(Vector2(valuePara-1,valuePara))
#	value.append(Vector2(valuePara+1,valuePara))
#	value.append(Vector2(valuePara,valuePara-1))
#	value.append(Vector2(valuePara,valuePara+1))
#
#
#
#
#func connectToTileMap(tilemapNode):
#	value[0] = tilemapNode.getEntByPos_quack(value[0])
#	value[1] = tilemapNode.getEntByPos_quack(value[1])
#	value[2] = tilemapNode.getEntByPos_quack(value[2])
#	value[3] = tilemapNode.getEntByPos_quack(value[3])
#
#
#func checkIfOn():
#	if isActive == true:
#		var stillActive = false
#		for i in value.size():
#
#			var boolActor  = SokraTiles.getActor().getEntByPos_quack(value[i])
#			var boolPlayer =  SokraTiles.getPlayer().getEntByPos_quack(value[i])
#
#			if boolActor != null or boolPlayer != null:
#				stillActive = true
#
#		if stillActive != true: changeTileOff()
#
#
#
#func changeTileOff():
#	var texture = owner.getCompValue(C_53_ALTERNATIVE_TEXTURE.name_quack())
#	SokraTiles.getMeatInteract().drawCell(texture,origin)
#
#	owner.getComp(C_1_ANY_IS_WALKABLE.name_quack()).value = true
#
#func changeTileOn():stillActive
#	var texture = owner.getCompValue(C_53_ALTERNATIVE_TEXTURE.name_quack())
#	SokraTiles.getMeatInteract().drawCell(texture,origin)
#
#	owner.getComp(C_1_ANY_IS_WALKABLE.name_quack()).value = true
#	isActive = true
#
#
#
#
#




