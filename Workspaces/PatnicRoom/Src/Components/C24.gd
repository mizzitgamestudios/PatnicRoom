extends Component
class_name C_24_ANY_CONDITION

var value

func _init(valuePara):
	name = "C_24_ANY_CONDITION"
	value = valuePara


static func getAutoDoc(): return{
	"suggestion"  : "",
	"description" : "list of Conditions the actor is affected by",
	"validInputs" : [],
	"validType"   : dioJSONType_quack(),
	"nameToShow"  : "Condition",
}