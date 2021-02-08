extends Node
class_name _KitsUILoader


var kitsShown = [null,null,null,null,null]
var nodeNameStringBase:String = "Kit" 
var playerKits = API_011_Player.currentChar.kitsSets.listOfKits
func _ready() -> void:
	getShownKitPanels()
	fillPanelWithKitToString()
	
	
	



func getShownKitPanels():
	for i in kitsShown.size():
		var stringToNode = str(nodeNameStringBase+str(i+1))
		kitsShown[i] = get_node(stringToNode)
		

func fillPanelWithKitToString():#
	var playerKitValue = playerKits.values()
	for i in playerKitValue.size():
		
		fillTitel(i,playerKitValue[i])
		fillBase(i,playerKitValue[i]["base"])
		fillMod(i,playerKitValue[i]["mod"])
		fillAppendix(i,playerKitValue[i]["mod"])


func fillTitel(i,kitpart):
	var titel = kitsShown[i].get_node("Title").get_node("text")
	titel.bbcode_text = kitpart.toString()

func fillBase(i,kitpart):
	var baseMechanicSummary = kitsShown[i].get_node("kitbase").get_node("BaseText") 
	baseMechanicSummary.bbcode_text = kitpart.mechanicalSummary.value

func fillMod(i,kitpart):
	if kitpart != null:
		var modMechanicSummary = kitsShown[i].get_node("kitMod").get_node("ModText") 
		modMechanicSummary.bbcode_text = kitpart.mechanicalSummary.value

func fillAppendix(i,kitpart):
	if kitpart != null:
		var appendixMechanicSummary = kitsShown[i].get_node("kitAppendix").get_node("AppendixText")  
		appendixMechanicSummary.bbcode_text = kitpart.mechanicalSummary.value


