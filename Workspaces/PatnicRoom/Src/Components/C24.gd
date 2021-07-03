extends Component
class_name C_24_ANY_REQUIRED_RACE

var value 
var atlasClassReference

func _init(valuePara:Array):
	name 				= "C_24_ANY_REQUIRED_RACE"
	value 				= valuePara[0]
	atlasClassReference = valuePara[1]


static func getAutoDoc(): return{
	"suggestion"  : "",
	"description" : "Template reference to an required race",
	"validInputs" : [],
	"validType"   : dioJSONType_quack(),
	"nameToShow"  : "required race",
}

static func dioJSONType_quack(): return "TEMPLATE"
static func name_quack(): return "C_24_ANY_REQUIRED_RACE"
