extends Control


var root
var kitset
func initialice(kitsetPara:KitPartEntity,rootPara):
	kitset = kitsetPara
	root = rootPara
	get_node("M_Type/RichTextLabel").bbcode_text   = kitset.mType()
	get_node("Category/RichTextLabel").bbcode_text = kitset.catType()
	get_node("Part/RichTextLabel").bbcode_text     = ENUM.KITS.PARTS.keys()[kitset.partType()]
	get_node("toString/RichTextLabel").bbcode_text = kitset.toString()
	get_node("MechanicalSummary/RichTextLabel").bbcode_text = kitset.mechanicalSummary()
	print(kitset.partType())





func _on_Button_pressed() -> void:
	root.fillKitInfo(kitset)
