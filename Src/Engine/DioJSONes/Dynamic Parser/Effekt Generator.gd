extends Node
class_name DioJSONes_EffektGenerator


var conditions= {}


func parseText(test:String) -> void:
	var placeholder: String = "condition_burn_2"
	var type = placeholder.split("_")[0]
	
	if type == "condition":
		toCondition(placeholder)
	elif type == "stat":
		toStatMod(placeholder)




func toStatMod(effect):
	pass

func toCondition(effect):
	pass













