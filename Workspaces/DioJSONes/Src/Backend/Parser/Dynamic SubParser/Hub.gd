extends Node
class_name Parser_Dynamic_Hub


static func manageByComp(dict,componentName):
	match componentName:
		"C_37_M_TYPE": 		return Parser_Dynamic_C_37.run(dict)
