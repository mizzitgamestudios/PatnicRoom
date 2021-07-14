extends Control



func _ready() -> void:
	var player = API_006_Player.currentChar
	
	for i in range (0,4):
		var currentKitset = player.getGearedKitSetByNr(i)
		if is_instance_valid(currentKitset): fillEntry(i,currentKitset)
		
	



func fillEntry(i,kitset):
	var controle = get_node(str(i))
	controle.get_node("Mtype/RichTextLabel").bbcode_text = kitset.mType
	controle.get_node("category/RichTextLabel").bbcode_text = kitset.base.catType()
	
	controle.get_node("base/RichTextLabel").bbcode_text = kitset.base.name()
	if is_instance_valid(kitset.mod): controle.get_node("mod/RichTextLabel").bbcode_text = kitset.mod.name()
	if is_instance_valid(kitset.appendix): controle.get_node("appendix/RichTextLabel").bbcode_text = kitset.appendix.name()
