extends Control

var allKitparts
var inputText
var suggestedKit = []
var selectedKit


func _ready():
	allKitparts = API_001_Atlas.KitParts().atlas_Entry.keys()
	
	for i in allKitparts.size():
		allKitparts[i] = allKitparts[i].to_lower()
		
		
		
	for i in 3:
		get_node("suggest"+str(i)+"/nameInput").rootParent = self
		
	
	
	print('Hi')

func _input(event: InputEvent) -> void:
	
	if event is InputEventKey and event.is_pressed() and Util.Nodes.isMouseOnNode(get_node("input/nameZone2/nameInput")):
		
		suggestedKit.clear()
		
		inputText = get_node("input/nameZone2/nameInput").bbcode_text.to_lower()
		inputText += event.as_text().to_lower()
		get_node("input/nameZone2/nameInput").bbcode_text = inputText
		
		for i in allKitparts.size():
			var currentKitPart = allKitparts[i]
			
			var isValid = currentKitPart.begins_with(inputText)
			if isValid : suggestedKit.append(currentKitPart)
			if suggestedKit.size()==4: suggestedKit.erase(suggestedKit)
			
		
		showInSuggested()
		
		print (suggestedKit)
		
		




func showInSuggested():
	for j in 3:
		get_node("suggest"+str(j)+"/nameInput").bbcode_text = ""
		
	for i in suggestedKit.size():
		get_node("suggest"+str(i)+"/nameInput").bbcode_text = suggestedKit[i]




func setInputField(selectedKitPara:String):
	get_node("input/nameZone2/nameInput").bbcode_text = selectedKitPara
	selectedKit = selectedKitPara
	
#	var selectedKitInstance = API_001_Atlas.getKitByDrirectName(selectedKit)
#	var selectedKitCat = selectedKitInstance.getComp("C_31_KIT_CAT_TYPE")
#	get_node("../../form").getCheckboxByContent(selectedKitCat.value.to_lower())
	
