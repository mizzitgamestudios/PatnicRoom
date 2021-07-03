extends Node


func _ready() -> void:
	if is_instance_valid(API_006_Player.currentChar):
		var kitSetarr = API_006_Player.currentChar.kitset().listOfKits
		for i in kitSetarr.size():
			var nodeBase = get_node("list").get_node(str(i+1))
			
			nodeBase.get_node("Base/text").bbcode_text = kitSetarr.values()[i].base.toString()
			
			if kitSetarr.values()[i].hasMod():
				nodeBase.get_node("Mod/text").bbcode_text = kitSetarr[i].mod.toString()
			
			if kitSetarr.values()[i].hasAppendix():
				nodeBase.get_node("Appendix/text").bbcode_text = kitSetarr[i].appendix.toString()







