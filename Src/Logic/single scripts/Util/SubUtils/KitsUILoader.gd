extends Node
class_name _KitsUILoader


var kitsShown = [null,null,null,null,null]
var nodeNameStringBase:String = "Kit" 
var playerKits = API_011_Player.currentChar.kitset()
func _ready() -> void:
	getShownKitPanels()
	fillPanelWithKitToString()
	
	
	



func getShownKitPanels():
	for i in kitsShown.size():
		var stringToNode = str(nodeNameStringBase+str(i+1))
		kitsShown[i] = get_node(stringToNode)
		

func fillPanelWithKitToString():#
	var playerKitValue = playerKits.listOfKits.values()
	for i in playerKitValue.size():
		
		fillTitel(i,playerKitValue[i])
		fillBase(i,playerKitValue[0])


#		if playerKitValue.size() == 2:
#			if playerKitValue[1].partType() == "MOD":
#				fillMod(i,playerKitValue[1])
#			elif playerKitValue[1].partType() == "APPENDIX":
#				fillAppendix(i,playerKitValue[1])
#
#		if playerKitValue.size() == 3:
#			if playerKitValue[2].partType() == "MOD":
#				fillMod(i,playerKitValue[2])
#			elif playerKitValue[2].partType() == "APPENDIX":
#				fillAppendix(i,playerKitValue[2])


func fillTitel(i,kitpart):
	var titel = kitsShown[i].get_node("Title").get_node("text")
	titel.bbcode_text = kitpart.toString
	var coolDownTimer = kitsShown[i].get_node("Title").get_node("cooldownTimer")
	coolDownTimer.bbcode_text = kitpart.currentCooldownTimeToRTL()

func fillBase(i,kitpart):
	var baseMechanicSummary = kitsShown[i].get_node("kitbase").get_node("BaseText") 
	baseMechanicSummary.bbcode_text = kitpart.base.mechanicalSummary()

func fillMod(i,kitpart):
	if kitpart != null:
		var modMechanicSummary = kitsShown[i].get_node("kitMod").get_node("ModText") 
		modMechanicSummary.bbcode_text = kitpart.mechanicalSummary()

func fillAppendix(i,kitpart):
	if kitpart != null:
		var appendixMechanicSummary = kitsShown[i].get_node("kitAppendix").get_node("AppendixText")  
		appendixMechanicSummary.bbcode_text = kitpart.mechanicalSummary()


