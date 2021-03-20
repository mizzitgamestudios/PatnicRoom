extends Component
class_name C_28_ACTOR_RACIAL_FRIENDS

var races = []

func _init(entRacesArrayPara):
	name = "C_28_ACTOR_RACIAL_FRIENDS"
	races = entRacesArrayPara

func addToInventory(entPara):
	races.append(entPara)

func removeFromInventory(entPara):
	races.remove(entPara)



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
static func name_quack():      return "C_28_ACTOR_RACIAL_FRIENDS"
static func dioJSONType_quack(): return "ARRAY"
