extends Object
class_name _02_SourceHub


func getSourceSlot(sourceKeyword:String):
	match sourceKeyword:
		ENUM.EFFECT_SPACE_SOURCE.SELF        : 	return API_006_Player.currentChar.position()
		ENUM.EFFECT_SPACE_SOURCE.TEXTURE 	 :  pass
		ENUM.EFFECT_SPACE_SOURCE.LAST_TARGET :  pass
		ENUM.EFFECT_SPACE_SOURCE.LAST_HIT    :  pass




