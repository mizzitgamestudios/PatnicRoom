extends Component
class_name C_12_KITSET_INDEX

var value 

func _init(valuePara):
	name="C_12_KITSET_INDEX"
	value=valuePara

static func getAutoDoc(): return{
	"suggestion"  : "",
	"description" : "determinds the mousehover text",
	"validInputs" : [],
	"validType"   : dioJSONType_quack(),
	"nameToShow"  : "role description",
}

static func dioJSONType_quack():
	return "STRING"
static func name_quack():      return "C_12_KITSET_INDEX"
