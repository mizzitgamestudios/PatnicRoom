extends Node
class_name RowTypeHandler



var enum_scene_index = [
	{ "enum"       : ENUM.INPUT_ROW_TYPES.DICTIONARY_GROUP,
	  "row"        : "res://Src/Frontend/content creation/Rows/Button/Button.tscn",
	  "attributes" : "res://Src/Backend/DataStructures/PanelAttributes/GroupAttributes.gd" },
	
	{ "enum"       : ENUM.INPUT_ROW_TYPES.OPTION_BOX,
	  "row"        : "res://Src/Frontend/content creation/Rows/Optionbox/RowBoxScene.tscn",
	  "attributes" : "res://Src/Backend/DataStructures/PanelAttributes/OptionboxAttributes.gd" },
	
	{ "enum"       : ENUM.INPUT_ROW_TYPES.DEFAULT_TEXT,
	  "row"        : "res://Src/Frontend/content creation/Rows/Text/RowTextScene.tscn",
	  "attributes" : "res://Src/Backend/DataStructures/PanelAttributes/RTLAttributes.gd" }
]

func getSceneInstanceByComp(comp):
	var sceneType = _getSceneType(comp)
	return _getXInstance(sceneType,"row").instance()

func getAttributesClassByComp(comp):
	var sceneType = _getSceneType(comp)
	return _getXInstance(sceneType,"attributes")





func _getSceneType(currentComp):
	if   currentComp["validType"] == "DICTIONARY":			return ENUM.INPUT_ROW_TYPES.DICTIONARY_GROUP; 
	elif currentComp["validInputs"].size() > 0:				return ENUM.INPUT_ROW_TYPES.OPTION_BOX; 
	else:													return ENUM.INPUT_ROW_TYPES.DEFAULT_TEXT; 

func _getXInstance(sceneType,key):
	for currentEntry in enum_scene_index:
		if sceneType == currentEntry["enum"]:
			return load(currentEntry[key])
