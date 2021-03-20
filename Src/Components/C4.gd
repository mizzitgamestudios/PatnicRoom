extends Component
class_name C_4_ANY_MAGIC_NOISE

var value: int

func _init(valuePara):
	name = "C_4_ANY_MAGIC_NOISE"
	value = int(valuePara)


	
########################
# --- AUTODOC -------- #
########################
var  autodoc={
	"suggestion"  : "",
	"description" : "determinds the handicap for sourronding dice tosses",
	"validInputs" : [],
	"validType"   : dioJSONType_quack(),
	"nameToShow"  : "Magic Noise",
}
static func name_quack():      return "C_4_ANY_MAGIC_NOISE"
static func dioJSONType_quack(): return "INTEGER"
