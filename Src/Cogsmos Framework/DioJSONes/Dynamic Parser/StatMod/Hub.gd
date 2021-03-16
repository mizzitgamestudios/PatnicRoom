extends Object
class_name DIOJSONES_UNIQUE_STATMOD



static func manageUniqueStatmod(selectedPos, statmodName:String, modValue):
	var UNIQUE_STATMOD = DIOJSONES_SYNTAX.EFFECT_UNIQUE_STATMOD
	
	match statmodName:
			
			UNIQUE_STATMOD.U_CHANGE_TEXTURE:  		U_CHANGE_TEXTURE.run(selectedPos,modValue)
			UNIQUE_STATMOD.U_DEAL_PLAIN_DAMAGE:		U_DEAL_PLAIN_DAMAGE.run(selectedPos,modValue)
			UNIQUE_STATMOD.U_OPEN_DOOR:				U_OPEN_DOOR.run(selectedPos)
			UNIQUE_STATMOD.U_DEAL_STRUCTURAL_DAMAGE: U_DEAL_STRUCTURAL_DAMAGE.run(selectedPos,modValue)






 
 
