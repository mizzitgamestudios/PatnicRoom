extends Node
class_name _KitsUILoader


var kitsShown = [null,null,null,null,null]
var nodeNameStringBase:String = "Kit" 
var playerKits = API_006_Player.currentChar.getComp("C_51_PLAYER_KITSETS")
func _ready() -> void:
	getShownKitPanels()
	fillPanelWithKitToString()
	
	
	



func getShownKitPanels():
	for i in kitsShown.size():
		var stringToNode = str(nodeNameStringBase+str(i+1))
		kitsShown[i] = get_node(stringToNode)
		

func fillPanelWithKitToString():#
	var playerKitValue = API_006_Player.currentChar.kitventory.gearedKitset.listOfKits
	for i in playerKitValue.size():
		var currentEntry = playerKitValue.values()[i]
		fillTitel(i,currentEntry)
		fillBase(i,currentEntry)



func fillTitel(i,kitpart):
	var titel = kitsShown[i].get_node("Title").get_node("text")
	titel.bbcode_text = "[color=yellow]"+str(i+1)+" >[/color]  "+kitpart.toString
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


