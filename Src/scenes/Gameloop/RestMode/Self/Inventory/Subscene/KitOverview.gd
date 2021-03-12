extends Node

var kitSetarr = API_011_Player.currentChar.kitset().listOfKits
func _ready() -> void:
	for i in kitSetarr.size():
		var nodeBase = get_node("list").get_node(str(i+1))
		
		nodeBase.get_node("Base/text").bbcode_text = kitSetarr.values()[i].base.toString()
		
		if kitSetarr.values()[i].hasMod():
			nodeBase.get_node("Mod/text").bbcode_text = kitSetarr[i].mod.toString()
		
		if kitSetarr.values()[i].hasAppendix():
			nodeBase.get_node("Appendix/text").bbcode_text = kitSetarr[i].appendix.toString()







