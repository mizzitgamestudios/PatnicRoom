extends Component
class_name C_14_ACTOR_SPECIALTY_NAME

var value 

func _init(valuePara):
	name="C_14_ACTOR_SPECIALTY_NAME"
	value=valuePara



########################
# --- AUTODOC -------- #
########################
static func getAutoDoc(): return{
	"suggestion"  : "recommended length 2-3 words",
	"description" : "short name reference",
	"validInputs" : [],
	"validType"   : dioJSONType_quack(),
	"nameToShow"  : "Specialty name",
}
static func name_quack():      return "C_14_ACTOR_SPECIALTY_NAME"
static func dioJSONType_quack(): return "STRING"