extends Component
class_name C_25_ACTOR_PAINTOLLERANCE

var value

func _init():
	name = "C_25_ACTOR_PAINTOLLERANCE"
	value = 0

func modValue(valuePara):
	value = value + valuePara

static func getAutoDoc(): return{
	"suggestion"  : "",
	"description" : "ressistence to pain handycaps",
	"validInputs" : [],
	"validType"   : dioJSONType_quack(),
	"nameToShow"  : "Paintollerance",
}