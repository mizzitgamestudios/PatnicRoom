extends Control


onready var spaceMedium   = self.get_node("Medium/ContentPanel/RichTextLabel2")
onready var spaceReach    = self.get_node("Reach/ContentPanel/RichTextLabel2")
onready var spaceSource   = self.get_node("Source/ContentPanel/RichTextLabel2")
onready var spaceType     = self.get_node("Type/ContentPanel/RichTextLabel2")


var mType = ["Meat","Magic","Machine"]


func manageSpace(slot):
	var unit = slot.space
	spaceMedium.bbcode_text = unit.medium
	
	
	spaceReach.bbcode_text  = str(unit.reach)
	if str(unit.reach) == "1":  spaceReach.bbcode_text = "[color=yellow]ADJACENT"
	else:                spaceReach.bbcode_text = str(unit.reach)+" TILES"
	
	spaceSource.bbcode_text = unit.source
	
	
	spaceType.bbcode_text   = mType[unit.mTypeEnum]
