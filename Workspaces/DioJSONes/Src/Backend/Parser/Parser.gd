extends Node

var componentsAttributesClasses = []
var cachedEffectSet             = []



var dictForJSON: Dictionary
func buildGameElement():
	if Validator.validate():
		dictForJSON = {}
		
		getGenerall()
		getFlags()
		getMirrors()
		getStatics()
		getEffect()
		getDynamics()
		
		Utils.printJSON(dictForJSON)
		return dictForJSON



func getGenerall():
	for currentInput in componentsAttributesClasses:
		
		var key           = currentInput.componentName
		dictForJSON[key]  = currentInput.getInputToString()


func getFlags():
	for flag in Utils.componentsToLoad["flags to add"]:
		dictForJSON[flag] = "N/A"


func getMirrors():
	var objects      = Utils.componentsToLoad["mirrored values"].values()
	var reflects     = Utils.componentsToLoad["mirrored values"].keys()
	
	for currentInput in componentsAttributesClasses:
		var currentCompName = currentInput.componentName
		for i in objects.size():
			
			var currentObject  = objects[i]
			var currentMirror = reflects[i]
			
			if currentCompName == currentObject:
				dictForJSON[currentMirror] = dictForJSON[currentObject]


func getStatics():
	var keys            = Utils.componentsToLoad["static values"].keys()
	var values          = Utils.componentsToLoad["static values"].values()
	for i in keys.size():   dictForJSON[ keys[i] ] = values[i]


func getDynamics():
	for entry in Utils.componentsToLoad["dynamic values"]:
		dictForJSON[entry] = Parser_Dynamic_Hub.manageByComp(dictForJSON,entry)


func getEffect():
	if Utils.componentsToLoad["entity with effect"]: 
		dictForJSON["C_49_EFFECT_REFERENCE"] = Parser_Kit.parse()






