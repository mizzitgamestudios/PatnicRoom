extends Object
class_name _02_MediumHub


func calculateSelectedPositions(kitset:KitSetEntity,sourcePos:Vector2):
	var initial = kitset.initialSelect["SPACE"]
	var reach   = int(initial.reach)
	var texture = API_010_TilemapSelector.getHighlightTile(kitset)
	
	
	var sourceToStrings = SYNTAX.EFFECT().SPACE.MEDIUM.keys()
	var sourceToClasses = SYNTAX.EFFECT().SPACE.MEDIUM.values()
	
	for i in sourceToStrings.size():
		var currentSourceToString = sourceToStrings[i] 
		var currentSourceToClass  = sourceToClasses[i]["API"]
		
		if currentSourceToString == initial.medium: 
			return currentSourceToClass.run(reach, sourcePos, texture)


