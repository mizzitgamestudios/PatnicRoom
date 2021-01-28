extends Node

var padding=15
func createPanel(V2Origin,V2End,style,nodeOfBasicZone):
	var panel = Panel.new()
	
	panel.set_position(V2Origin)
	panel.set_size(V2End)
	panel.set("custom_styles/panel",style)
	panel.name = "typeRequirements"

	nodeOfBasicZone.get_node("..").add_child(panel)



func calculatePanelSize(numberOfReqirements):
	var sumHeightEntry = numberOfReqirements * EntryConstructor.sizeHeight
	var sumHeightPadding = (numberOfReqirements + 1) * PanelConstructor.padding
	return Vector2(896,sumHeightPadding+sumHeightEntry)
