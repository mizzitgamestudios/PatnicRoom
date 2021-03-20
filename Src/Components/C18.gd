extends Component
class_name C_18_ACTOR_ATTRIBUTEMOD

var value=0

func _init():
	name = "C_18_ACTOR_ATTRIBUTEMOD"



func modValue(valuePara):
	value+=int(valuePara)



########################
# --- AUTODOC -------- #
########################
var  autodoc={
	"suggestion"  : "",
	"description" : "name of its fightingstyle",
	"validInputs" : [],
	"validType"   : dioJSONType_quack(),
	"nameToShow"  : "role description",
}
static func name_quack():      return "C_18_ACTOR_ATTRIBUTEMOD"
static func dioJSONType_quack(): return "NULL"
