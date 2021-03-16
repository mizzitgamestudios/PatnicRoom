extends Component
class_name C_19_ACTOR_ATTRIBUTES

var agillity        = C_18_ACTOR_ATTRIBUTEMOD.new()
var reaction        = C_18_ACTOR_ATTRIBUTEMOD.new()
var constitution    = C_18_ACTOR_ATTRIBUTEMOD.new()
var strength        = C_18_ACTOR_ATTRIBUTEMOD.new()

var willpower       = C_18_ACTOR_ATTRIBUTEMOD.new()
var logic           = C_18_ACTOR_ATTRIBUTEMOD.new()
var intuition       = C_18_ACTOR_ATTRIBUTEMOD.new()
var charisma        = C_18_ACTOR_ATTRIBUTEMOD.new()


var value = {}


func _init(attributedictPara):
	name = "C_19_ACTOR_ATTRIBUTES"
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



########################
# --- AUTODOC -------- #
########################
const autodoc={
	"title":"relevant layer",
	"description":"descibes the most relevant layer of Tile",
	"className":"C_3_ANY_LAYER",
	"moduleName":"00_00 Basic Tile Components",
	"dataType":"String",
	"notable":"Needs to be a key of the naming convention 'ENUM.LAYERS_OF_EFFECT.SOKRATILES_LAYER'"
}
static func name_quack():      return "C_19_ACTOR_ATTRIBUTES"
static func dioJSONType_quack(): return "DICTIONARY"