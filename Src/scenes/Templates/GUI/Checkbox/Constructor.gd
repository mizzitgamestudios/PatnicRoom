extends Node
class_name CheckboxConstructor

var universalCheckbox = preload("res://Src/scenes/Templates/GUI/Checkbox/universal Cheackbox.tscn")


var constructDictionaryExample ={
	"upperLeft"                        : [0,0],
	"size"                             : [0,0],
	"name of Checkbox"                 : "",
	"checkboxToString"                 : "",
	"grouping"                         : "",
	"nodeOfWhereToAdd"                 : "nodeOfWhereToAddButInNode",
	"formListenerNode"                 : "formListenerNodeButInNode",
}
func construct(constructDictionaryPara):
	var upperLeft = Vector2(constructDictionaryPara["upperLeft"][0],constructDictionaryPara["upperLeft"][1])
	var universalCheckboxInstance = universalCheckbox.instance()
	
	
	universalCheckboxInstance._set_global_position(upperLeft)
	universalCheckboxInstance.visible = true
	universalCheckboxInstance.name=constructDictionaryPara["name of Checkbox"]
	universalCheckboxInstance.set_size(Vector2(30,30))
	universalCheckboxInstance.innerBox= universalCheckboxInstance.get_node("marker")
	universalCheckboxInstance.toString=constructDictionaryPara["checkboxToString"]
	
	
	if constructDictionaryPara.has("formListenerNode"):
		universalCheckboxInstance.formListenerNode = constructDictionaryPara["formListenerNode"]
	else:
		universalCheckboxInstance.formListenerNode = constructDictionaryPara["nodeOfWhereToAdd"]
		
	if constructDictionaryPara.has("grouping"):
		universalCheckboxInstance.grouping = constructDictionaryPara["grouping"]
	
	var parent = constructDictionaryPara["nodeOfWhereToAdd"]
	parent.add_child(universalCheckboxInstance)
	return universalCheckboxInstance



var compactConstructArraySimple = [0,0,"nameOfCheckboxAndItsToString",get_node(".")]
var compactConstructArrayExtended = [0,0,"name of Checkbox","checkboxToString","grouping",get_node("."),get_node(".")]
func compactConstruct(compactConstrucArrayPara):
	if compactConstrucArrayPara.size()==5:
		return construct( getFormatetArrayBasic(compactConstrucArrayPara) )
	if compactConstrucArrayPara.size()==7:
		return construct( getFormatetArrayLikeDictionary(compactConstrucArrayPara) )
	else:
		printSyntaxException( str(compactConstrucArrayPara) )



func getFormatetArrayBasic(compactConstrucArrayPara):
	var formatedDictioanaryOfArrayPara={
		"upperLeft"               : [compactConstrucArrayPara[0],compactConstrucArrayPara[1]],
		"name of Checkbox"        : compactConstrucArrayPara[2],
		"grouping"                : compactConstrucArrayPara[3],
		"nodeOfWhereToAdd"        : compactConstrucArrayPara[4],
		"formListenerNode"        : compactConstrucArrayPara[4],
		"checkboxToString"        : compactConstrucArrayPara[2],
	}
	return formatedDictioanaryOfArrayPara

func getFormatetArrayLikeDictionary(compactConstrucArrayPara):
	var formatedDictioanaryOfArrayPara={
		"upperLeft"               : [compactConstrucArrayPara[0],compactConstrucArrayPara[1]],
		"name of Checkbox"        : compactConstrucArrayPara[2],
		"checkboxToString"        : compactConstrucArrayPara[3],
		"grouping"                : compactConstrucArrayPara[4],
		"nodeOfWhereToAdd"        : compactConstrucArrayPara[5],
		"formListenerNode"        : compactConstrucArrayPara[6],
	}
	return formatedDictioanaryOfArrayPara


func printSyntaxException(varname):
	print("-----EXCEPTION-------")
	print("there is a possibly wrong Syntax in the construction of checkbox namend: "+varname)

