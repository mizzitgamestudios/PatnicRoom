extends Component
class_name C_50_ACTOR_ROLE_DESCRIPTION

var value 

func _init(valuePara):
	name="C_50_ACTOR_ROLE_DESCRIPTION"
	value=valuePara

var  autodoc={
	"suggestion"  : "",
	"description" : "determinds the mousehover text",
	"validInputs" : [],
	"validType"   : dioJSONType_quack(),
	"nameToShow"  : "role description",
}

func dioJSONType_quack():
	return "STRING"