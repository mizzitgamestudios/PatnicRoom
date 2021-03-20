extends Component
class_name C_27_ACTOR_RACIAL_ENEMIES

var races = []

func _init(entRacesArrayPara):
	name = "C_27_ACTOR_RACIAL_ENEMIES"
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
static func name_quack():      return "C_27_ACTOR_RACIAL_ENEMIES"
static func dioJSONType_quack(): return "ARRAY"
