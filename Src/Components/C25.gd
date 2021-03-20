extends Component
class_name C_25_ACTOR_PAINTOLLERANCE

var value

func _init():
	name = "C_25_ACTOR_PAINTOLLERANCE"
	value = 0

func modValue(valuePara):
	value = value + valuePara

var  autodoc={
	"suggestion"  : "",
	"description" : "name of its fightingstyle",
	"validInputs" : [],
	"validType"   : dioJSONType_quack(),
	"nameToShow"  : "role description",
}