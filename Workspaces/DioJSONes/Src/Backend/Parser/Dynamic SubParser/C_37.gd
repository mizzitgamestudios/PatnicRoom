extends Node
class_name Parser_Dynamic_C_37 

static func run(dict):
	var meat   = ["GUN","ARMOR","MEELE"]
	var matrix = ["CYBERWARE","HACK","DRONE"]
	var magic  = ["RITE","INFUSION","SPELL"]
	
	var kitCat = dict["C_31_KIT_CAT_TYPE"]
	
	if meat.has(kitCat): 		return "MEAT"
	elif matrix.has(kitCat): 	return "MATRIX"
	elif magic.has(kitCat):		return "MAGIC"
	 
