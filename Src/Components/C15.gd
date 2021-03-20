extends Component
class_name C_15_ACTOR_ARRAY_BODYPARTS

var value = []

func _init(valuePara):
	name = "C_15_ACTOR_ARRAY_BODYPARTS"
	value = valuePara


func addToInventory(entPara):
	value.append(entPara)

func removeFromInventory(entPara):
	value.remove(entPara)



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
static func name_quack():        return "C_15_ACTOR_ARRAY_BODYPARTS"
static func dioJSONType_quack(): return "CONTAINER"
