extends Component
class_name C_10_ACTOR_PERKS

var description=[]

func _init(descriptionPara):
	name = "C_10_ACTOR_PERKS"
	description = descriptionPara



########################
# --- AUTODOC -------- #
########################
static func getAutoDoc(): return{
	"suggestion"  : "",
	"description" : "determinds the handicap for sourronding dice tosses",
	"validInputs" : [],
	"validType"   : dioJSONType_quack(),
	"nameToShow"  : "perks",
}
static func name_quack():      return "C_10_ACTOR_PERKS"
static func dioJSONType_quack(): return "ARRAY"
