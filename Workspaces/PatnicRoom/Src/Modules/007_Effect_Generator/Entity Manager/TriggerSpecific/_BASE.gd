extends Object
class_name Effect_Trigger_Specific_Base


func _init(dummy:Array): pass 



func getValueToString_quack():   return "N/A"
func getName_quack():            return "BASE"

func getParameter_quack(): 
	return {}




func run(collectedEnts):   return collectedEnts





static func getDoc():
	return {
		
		"keyword"          : "BASE",
		"name"             : "basic Trigger",

		"unit"             : "TRIGGER",    
		"stat"             : "SPECIFIC",

		"toString"        : "dont reduces selects any further",

		"inputModule" : "VOID"

	}
