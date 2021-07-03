extends Control
class_name PanelConstructor


var constructDictionary ={
	"upperLeft"                        : [0,0],
	"size"                             : [0,0],
	"name of Panel"                    : "",
	"style"                            : "StyleButInObject",
	"nodePathToStringToAddInAbsolut"   : "",
}
func construct(constructDictionaryPara):
	var entry = Panel.new()
	
	entry._set_global_position(constructDictionaryPara["upperLeft"][0] , constructDictionaryPara["upperLeft"][1])
	entry.set_size(constructDictionaryPara["size"][0] , constructDictionaryPara["size"][1])
	
	entry.name=constructDictionaryPara["name of Panel"]
	entry.set('custom_styles/panel', constructDictionaryPara["style"])
	
	
	get_tree().get_root().get_node(constructDictionaryPara["nodePathToStringToAdd"]).add_child(entry)
	return entry


var compactConstructArrayExtended = ["xInString","yInString","widthInString","heightInString","name of panel","nodePathToStringToAddInAbsolut"]
var compactConstructArraySimple = ["xInString","yInString","widthInString","heightInString","nodePathToStringToAddInAbsolut"]
func compactConstruct(constructDictionary):
	var entry = Panel.new()
	var entryInstance = entry.instance()
	
	entry._set_global_position(Vector2(constructDictionary[0],constructDictionary[1]))
	entry.set_size(Vector2(constructDictionary[2],constructDictionary[3]) )
	
	entry.name="entry"
	entry.set('custom_styles/panel', style)
	
	return entry

