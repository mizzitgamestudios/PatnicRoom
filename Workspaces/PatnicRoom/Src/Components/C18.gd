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
static func getAutoDoc(): return{
	"suggestion"  : "",
	"description" : "Attribute mod",
	"validInputs" : [],
	"validType"   : dioJSONType_quack(),
	"nameToShow"  : "modulacation of C_19, we recommend C_19 for usage",
}
static func name_quack():      return "C_18_ACTOR_ATTRIBUTEMOD"
static func dioJSONType_quack(): return "NULL"
