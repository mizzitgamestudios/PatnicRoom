extends Component
class_name C_52_ACTOR_GEAR

var value = []

func _init(valuePara):
	name = "C_52_ACTOR_GEAR"
	value = valuePara



########################
# --- AUTODOC -------- #
########################
static func getAutoDoc(): return{
	"suggestion"  : "",
	"description" : "name of its fightingstyle",
	"validInputs" : [],
	"validType"   : dioJSONType_quack(),
	"nameToShow"  : "role description",
}
static func name_quack():      return "C_52_ACTOR_GEAR"
<<<<<<< HEAD
static func dioJSONType_quack(): return "ARRAY"
=======
static func dioJSONType_quack(): return "ARRAY"
>>>>>>> 14ed4bc523602584d0fecdfce3fc61f9ee8a2684
