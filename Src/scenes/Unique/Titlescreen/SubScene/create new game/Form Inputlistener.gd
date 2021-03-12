extends Node2D

##################################
## -- Prepares list of Nodes -- ##
##################################


var style
var trueCheck = StyleBoxFlat.new()
var universalCheckbox = preload("res://Src/scenes/Templates/GUI/Checkbox/universal Cheackbox.tscn")
var checkboxManager=StyleManager.new()

func _ready():
	get_node("form").setPerk(get_node("."))
	get_node("form").setRace(get_node("."))
	get_node("form").setKit(get_node("."))
	get_node("form").setTextfield(get_node("."))
	get_node("form").setAttribute(get_node("."))
	

func manageCheckboxes(checkbox):
	match checkbox.grouping:
		"perk":
			API_011_Player.chargenSelecttion["perks"] = checkbox.toString
			clearBoxfield(allPerkCheckboxes)

		"kit":
			API_011_Player.chargenSelecttion["Kits"] = checkbox.toString
			clearBoxfield(allKitCheckboxes)
		"race":
			API_011_Player.chargenSelecttion["race"] = checkbox.toString
			clearBoxfield(allRaceCheckboxes)
	checkbox.innerBox.visible=true
	

func clearBoxfield(arrOfTypePfSelection):
	for i in arrOfTypePfSelection.size():
			var checkbox = arrOfTypePfSelection[i]
			var innercheckbox=checkbox.get_node("marker")

			if innercheckbox.visible:
				innercheckbox.visible = false

func _input(event):
	if event.is_pressed() and event.is_action("escape"):
		var cache = get_node(".")
		get_parent().remove_child(get_node("."))
		cache.queue_free()


var allKitCheckboxes=[]
var allPerkCheckboxes=[]
var allRaceCheckboxes=[]
var allTextFieldPanels=[]
func addInputfieldToFormgroup(universalCheckboxInstance,type):
	match type:
		"perk":
			allPerkCheckboxes.append(universalCheckboxInstance)
		"kit":
			allKitCheckboxes.append(universalCheckboxInstance)
		"race":
			allRaceCheckboxes.append(universalCheckboxInstance)
