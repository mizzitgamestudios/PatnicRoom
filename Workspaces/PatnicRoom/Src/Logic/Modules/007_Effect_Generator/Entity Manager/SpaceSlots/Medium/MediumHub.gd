extends Object
class_name _02_MediumHub


func calculateSelectedPositions(kitset:KitSetEntity,sourcePos:Vector2):
	var initial = kitset.initialSelect["SPACE"]
	var reach   = int(initial.reach)
	var texture = API_010_TilemapSelector.getHighlightTile(kitset)
	
	match initial.medium:
		ENUM.EFFECT_SPACE_MEDIUM.LINEA      :	API_010_TilemapSelector.drawCrosshairOnPos(reach, sourcePos, texture)
		ENUM.EFFECT_SPACE_MEDIUM.AREA       :	API_010_TilemapSelector.drawAreaOnPos(reach, sourcePos, texture)
		ENUM.EFFECT_SPACE_MEDIUM.SELECT     :	API_010_TilemapSelector.drawAreaOnPos(reach, sourcePos, texture)
		ENUM.EFFECT_SPACE_MEDIUM.LINEA_AREA :	pass # STUB    
		ENUM.EFFECT_SPACE_MEDIUM.SELF       :	pass # STUB    



