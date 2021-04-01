extends Component
class_name C_14_ACTOR_SPECIALTY_NAME

var value 

func _init(valuePara):
	name="C_14_ACTOR_SPECIALTY_NAME"
	value=valuePara



########################
# --- AUTODOC -------- #
########################
var  autodoc={
	"suggestion"  : "",
	"description" : "the name of the specialty which references to multiple Synonyms",
	"validInputs" : [],
	"validType"   : dioJSONType_quack(),
	"nameToShow"  : "index Name",
}
static func name_quack():      return "C_14_ACTOR_SPECIALTY_NAME"
static func dioJSONType_quack(): return "STRING"