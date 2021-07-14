extends Node
class_name _DioJSON_Common_Template


var originalDict        : Dictionary
var entOfParse          : Entity

var atlasEntries        : Dictionary
var entryIndex          : String
var templateName        : String

var templateEnt         : Template
var timesOfTriedCopy    : int = 0

var neededTemplates     : Array



func _init(dictToParse:Dictionary, entToFill:Entity) -> void:
	originalDict = dictToParse
	entOfParse   = entToFill

	getTemplatePairNr( dictToParse.keys() )
	updatePair()
	


func getTemplatePairNr(allKeys:Array): 
	for i in allKeys.size():   
		if COMP.HAS_TEMPLATE( allKeys[i] ):  neededTemplates.append(allKeys[i])






func areTemplatesFullfilled(): 
	return neededTemplates.empty()


func updatePair():
	entryIndex    = neededTemplates.pop_front()
	templateName  = originalDict[entryIndex]	
	atlasEntries  = COMP.GET_TEPLATE_ENTRIES(templateName)


func setTemplateEnt():   
	templateEnt = atlasEntries[entryIndex]
	entOfParse.addTemplate(templateName,templateEnt)
	updatePair()


func isNeededTemplateAvailable(): 
	timesOfTriedCopy += 1
	return atlasEntries.has(neededTemplates.front())
		
