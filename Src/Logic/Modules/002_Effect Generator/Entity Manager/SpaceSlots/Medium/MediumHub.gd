extends Object
class_name _02_MediumHub


func calculateSelectedPositions(kitset:KitSetEntity,sourcePos:Vector2):
	var initial = kitset.initialSelect["SPACE"]
	var texture = API_014_TilemapSelector.getHighlightTile(kitset)
	
	match initial.medium:
		ENUM.EFFECT_SPACE_MEDIUM.LINEA:
				API_014_TilemapSelector.drawCrosshairOnPos( int(initial.reach), sourcePos, texture )
			
		
		ENUM.EFFECT_SPACE_MEDIUM.AREA:
			API_014_TilemapSelector.drawAreaOnPos( int(initial.reach), sourcePos, texture )
		
		
		
		ENUM.EFFECT_SPACE_MEDIUM.LINEA_AREA:
			# TODO                               
				pass
		
		
		ENUM.EFFECT_SPACE_MEDIUM.SELECT:
			API_014_TilemapSelector.drawAreaOnPos(int(initial.reach), sourcePos, texture)
		
		
		
		ENUM.EFFECT_SPACE_MEDIUM.SELF:
			# TODO                               
				pass

	


