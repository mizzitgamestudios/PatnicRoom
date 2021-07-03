extends Object
class_name _02_SourceHub


func getSourceSlot(sourceKeyword:String):
	var sourceToStrings = SYNTAX.EFFECT().SPACE.SOURCE.keys()
	var sourceToClasses = SYNTAX.EFFECT().SPACE.SOURCE.values()
	
	for i in sourceToStrings.size():
		var currentSourceToString = sourceToStrings[i] 
		var currentSourceToClass  = sourceToClasses[i]
		
		if currentSourceToString == sourceKeyword: return currentSourceToClass.run()




