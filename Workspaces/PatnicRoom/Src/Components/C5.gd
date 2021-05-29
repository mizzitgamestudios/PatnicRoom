extends Component
class_name C_5_ANY_MATRIX_NOISE

var value: int

func _init(valuePara):
	name = "C_5_ANY_MATRIX_NOISE"
	value = int(valuePara)



########################
# --- AUTODOC -------- #
########################
static func getAutoDoc(): return{
	"suggestion"  : "",
	"description" : "determinds the handicap for sourronding dice tosses",
	"validInputs" : [],
	"validType"   : dioJSONType_quack(),
	"nameToShow"  : "Matrix Noise",
}
static func name_quack():      return "C_5_ANY_MATRIX_NOISE"
static func dioJSONType_quack(): return "INTEGER"
