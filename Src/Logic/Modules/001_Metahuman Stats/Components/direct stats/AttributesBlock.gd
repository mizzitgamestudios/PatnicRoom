extends Component
class_name Comp_Actor_Attributes

var agillity        = Comp_NPC_AttributeMod.new()
var reaction        = Comp_NPC_AttributeMod.new()
var constitution    = Comp_NPC_AttributeMod.new()
var strength        = Comp_NPC_AttributeMod.new()

var willpower       = Comp_NPC_AttributeMod.new()
var logic           = Comp_NPC_AttributeMod.new()
var intuition       = Comp_NPC_AttributeMod.new()
var charisma        = Comp_NPC_AttributeMod.new()


var value = {}


func _init(attributedictPara):
	name = "Comp_Actor_Attributes"
	updateAttributes(attributedictPara)
	fillValue()



func updateAttributes(attributedictPara):
	var keysarray= attributedictPara.keys()
	if (keysarray[0].length() > 3):
		agillity.modValue(attributedictPara["agillity"])
		reaction.modValue(attributedictPara["reaction"])
		constitution.modValue(attributedictPara["constitution"])
		strength.modValue(attributedictPara["strength"])
		
		willpower.modValue(attributedictPara["willpower"])
		logic.modValue(attributedictPara["logic"])
		intuition.modValue(attributedictPara["intuition"])
		charisma.modValue(attributedictPara["charisma"])
	
	else:
		agillity.modValue(attributedictPara["agi"])
		reaction.modValue(attributedictPara["rea"])
		constitution.modValue(attributedictPara["con"])
		strength.modValue(attributedictPara["str"])
		
		willpower.modValue(attributedictPara["wil"])
		logic.modValue(attributedictPara["log"])
		intuition.modValue(attributedictPara["int"])
		charisma.modValue(attributedictPara["cha"])


func fillValue():
	value["agillity"] = agillity.value
	value["reaction"] = reaction.value
	value["constitution"] = constitution.value
	value["strength"] = strength.value
	
	value["willpower"] = willpower.value
	value["logic"] = logic.value
	value["intuition"] = intuition.value
	value["charisma"] = charisma.value


