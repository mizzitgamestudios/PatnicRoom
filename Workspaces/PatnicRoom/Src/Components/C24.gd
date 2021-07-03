extends Component
<<<<<<< HEAD
class_name C_24_ANY_REQUIRED_RACE

var value 
var atlasClassReference

func _init(valuePara:Array):
	name 				= "C_24_ANY_REQUIRED_RACE"
	value 				= valuePara[0]
	atlasClassReference = valuePara[1]
=======
class_name C_24_ANY_CONDITION

var value

func _init(valuePara):
	name = "C_24_ANY_CONDITION"
	value = valuePara
>>>>>>> 14ed4bc523602584d0fecdfce3fc61f9ee8a2684


static func getAutoDoc(): return{
	"suggestion"  : "",
<<<<<<< HEAD
	"description" : "Template reference to an required race",
	"validInputs" : [],
	"validType"   : dioJSONType_quack(),
	"nameToShow"  : "required race",
}

static func dioJSONType_quack(): return "TEMPLATE"
static func name_quack(): return "C_24_ANY_REQUIRED_RACE"
=======
	"description" : "list of Conditions the actor is affected by",
	"validInputs" : [],
	"validType"   : dioJSONType_quack(),
	"nameToShow"  : "Condition",
}
>>>>>>> 14ed4bc523602584d0fecdfce3fc61f9ee8a2684
