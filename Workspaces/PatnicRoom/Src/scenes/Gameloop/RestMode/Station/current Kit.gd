extends Control


# ----- INITIALICE ----------------------------------------------------------- ##


onready var baseRTL     : RichTextLabel = get_node("content/base/RichTextLabel")
onready var modRTL      : RichTextLabel = get_node("content/mod/RichTextLabel")
onready var appendixRTL : RichTextLabel = get_node("content/appendix/RichTextLabel")

var keywordsList = ["base","mod","appendix"]
var uiNodes
var kitset


# ----- FILL ENTRY ----------------------------------------------------------- ##


func buttonPressed(extra_arg_0: int) -> void:
	kitset = API_006_Player.currentChar.getGearedKitSetByNr(extra_arg_0)
	reset()
	
	if is_instance_valid(kitset):
		
		for kitPart in keywordsList: 
			uiNodes = getNodesByKitPart(kitPart)
			
			if is_instance_valid(uiNodes.kitpart): fillKitPart()
			else: uiNodes.voidButtons.visible = true
		   


func fillKitPart():
	uiNodes.filledButtons[0].visible = true
	uiNodes.filledButtons[1].visible = true
	uiNodes.rtl.bbcode_text          = uiNodes.kitpart.name()



# ----- CLEAR ENTRY ----------------------------------------------------------- ##


func reset():
	for entry in ["mod","base","appendix"]:
		var nodePathRTL = "content/"+entry+"/RichTextLabel"
		get_node(nodePathRTL).clear()
		
		
		for button in ["add","change","delete"]:
			var nodePathButton = "content/"+entry+"/buttons/"+button
			get_node(nodePathButton).visible = false



# ----- HELPER ----------------------------------------------------------- ##


func getNodesByKitPart(keyword):
	if keyword == "mod"      : return UINodes.new(kitset.mod, modRTL)
	if keyword == "base"     : return UINodes.new(kitset.base, baseRTL)
	if keyword == "appendix" : return UINodes.new(kitset.appendix, appendixRTL)



class UINodes:
	var kitpart; var rtl ; var filledButtons ; var voidButtons
	
	func _init(kitPartPara,rtlPara) -> void:
		var buttonHub = rtlPara.get_parent().get_node("buttons")
		
		kitpart       =   kitPartPara
		rtl           =   rtlPara
		filledButtons = [ buttonHub.get_node("change"), buttonHub.get_node("delete") ]
		voidButtons   =   buttonHub.get_node("add")




