extends Node

var filehandler:     FileHandler
var dataTypeHandler: DataTypeHandler
var inputHandler:    InputHandler
var rowTypeHandler: RowTypeHandler

var componentsToLoad: Dictionary
var filePathToPatnicroom

func _init() -> void:
	filehandler     = FileHandler.new()
	dataTypeHandler = DataTypeHandler.new()
	inputHandler    = InputHandler.new()
	rowTypeHandler  = RowTypeHandler.new()


# FORM INITIALICER #
func getBaseKitsFormComp():             return getCompDocsOfArray( getForms()["KITS-BASE"] )
func getModKitsFormComp():              return getCompDocsOfArray( getForms()["KITS-MOD"] )
func getAppendixKitsFormComp():         return getCompDocsOfArray( getForms()["KITS-APPENDIX"] )
func getRaceActorsFormComp():           return getCompDocsOfArray( getForms()["ACTORS-RACE"] )
func getSpecialtyActorComp():           return getCompDocsOfArray( getForms()["ACTORS-SPECIALTY"] )
func getRoleActorFormComp():            return getCompDocsOfArray( getForms()["ACTORS-ROLE"] )
func getItemFormComp():                 return getCompDocsOfArray( getForms()["ITEMS"] )

func getForms():                        return Utils.fileToDictionary("res://config/forms.json")



# FILE HANDLER #
func fileToDictionary(filepath):        return filehandler.fileToDictionary(filepath)
func printJSON(dict):                          filehandler.printForm(dict)



# DATATYPE HANDLER #
func getDataToString(dataType:String):  return dataTypeHandler.getDataToString(dataType)
func getStyle(dataType:String):         return dataTypeHandler.getStyle(dataType)
func getWidth(dataType:String):         return dataTypeHandler.getWidth(dataType)
func getCompDocsOfArray(compsArr:Array):return dataTypeHandler.getCompDocsOfArray(compsArr)



# INPUT HANDLER #
func isMouseOnNode(node):               return inputHandler.isMouseOnMode(node)



# ROWTYPE HANDLER

func getSceneInstanceByComp(comp): 			return rowTypeHandler.getSceneInstanceByComp(comp)
func getAttributesClassByComp(comp): 		return rowTypeHandler.getAttributesClassByComp(comp)



func getLoadedModule(moduleToString): return load(filehandler.getModule(moduleToString))


func getLoadedModuleByToString(selectedItem):
	var key = SYNTAX.INPUT_TO_KEYWORD(selectedItem)
	var syntax = SYNTAX.masterAtlas
	syntax = SYNTAX.masterAtlas[key]["moduleName"]
	return getLoadedModule(syntax)





