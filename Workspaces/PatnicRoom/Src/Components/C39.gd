extends Component
class_name C_39_KIT_STRATEGY_KEYWORD

var value = []

func _init(valuePara):
	name = "C_39_KIT_STRATEGY_KEYWORD"
	value = valuePara


static func name_quack():
	return "C_39_KIT_STRATEGY_KEYWORD"

static func getAutoDoc(): return{
	"suggestion"  : "",
	"description" : "name of its fightingstyle",
	"validInputs" : [],
	"validType"   : dioJSONType_quack(),
	"nameToShow"  : "role description",
}