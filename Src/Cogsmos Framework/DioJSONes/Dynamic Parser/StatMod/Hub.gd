extends Object
class_name DIOJSONES_UNIQUE_STATMOD



static func manageUniqueStatmod(selectedPos, statmodName:String, modValue):
	var UNIQUE_STATMOD = DIOJSONES_SYNTAX.EFFECT_UNIQUE_STATMOD
	
	if is_instance_valid(selectedPos):
		match statmodName:
				
				UNIQUE_STATMOD.U_CHANGE_TEXTURE:  		U_CHANGE_TEXTURE.run(selectedPos,modValue)
				UNIQUE_STATMOD.U_DEAL_PLAIN_DAMAGE:		U_DEAL_PLAIN_DAMAGE.run(selectedPos,int(modValue))
				UNIQUE_STATMOD.U_OPEN_DOOR:				U_OPEN_DOOR.run(selectedPos)
				UNIQUE_STATMOD.U_DEAL_STRUCTURAL_DAMAGE: U_DEAL_STRUCTURAL_DAMAGE.run(selectedPos,modValue)
				UNIQUE_STATMOD.U_SPAWN_TILE:              U_SPAWN_TILE.run(selectedPos,modValue)
				UNIQUE_STATMOD.U_CLOSE_DOOR: 		U_CLOSE_DOOR.run(selectedPos,modValue)






 
 
