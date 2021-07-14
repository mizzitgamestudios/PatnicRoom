extends Node
class_name Syntax_Effect

var masterIndex       = {}
var masterAtlas       = {}
var crossReferenceInputKeyword = {}

var triggerBase       = []
var triggerSpecific   = []

var source            = []
var medium            = []
var mType             = ["MEAT","MAGIC","MATRIX"]

var statMod           = []
var conditions        = []

var modules           = []


func GET_STAT_MOD():                   return statMod
func GET_CONDITION():                  return conditions
func GET_TRIGGER_BASE():               return triggerBase
func GET_TRIGGER_SPECIFIC():           return triggerSpecific
func GET_SOURCE():                     return source
func GET_MEDIUM():                     return medium
func GET_M_TYPE():                     return mType



func GET_STAT_MOD_TO_STRING():         return convertArrayOfkeywordToString(statMod)
func GET_CONDITION_TO_STRING():        return convertArrayOfkeywordToString(conditions)
func GET_TRIGGER_BASE_TO_STRING():     return convertArrayOfkeywordToString(triggerBase)
func GET_TRIGGER_SPECIFIC_TO_STRING(): return convertArrayOfkeywordToString(triggerSpecific)
func GET_SOURCE_TO_STRING():           return convertArrayOfkeywordToString(source)
func GET_MEDIUM_TO_STRING():           return convertArrayOfkeywordToString(medium)
func GET_M_TYPE_TO_STRING():           return convertArrayOfkeywordToString(mType)






func _ready() -> void:
	masterIndex = Utils.fileToDictionary("res://config/SyntaxIndex.json")
	masterAtlas = Utils.fileToDictionary("res://config/SyntaxAtlas.json")
	modules     = Utils.fileToDictionary("res://config/ModulesReference.json")
	sortKeyordsInGroups()


func sortKeyordsInGroups():
	triggerBase     = masterIndex["TRIGGER"]["BASE"]
	triggerSpecific = masterIndex["TRIGGER"]["SPECIFIC"]
	source          = masterIndex["SPACE"]["SOURCE"]
	medium          = masterIndex["SPACE"]["MEDIUM"]
	statMod         = masterIndex["EFFECT"]["STAT_MOD"]
	conditions      = masterIndex["EFFECT"]["CONDITION"]



func convertArrayOfkeywordToString(arr:Array):
	var arrToReturn = []
	
	for i in arr.size():
		var currentKeyword = arr[i]
		
		if masterAtlas.has(currentKeyword): 
			var keywordToString = masterAtlas[currentKeyword]["toString"]
			arrToReturn.append(keywordToString)
			crossReferenceInputKeyword[keywordToString] = currentKeyword
		
		else: arrToReturn.append( currentKeyword )
	
	return arrToReturn


func INPUT_TO_KEYWORD(input:String):
	if crossReferenceInputKeyword.has(input): return crossReferenceInputKeyword[input]
	else: return ""

