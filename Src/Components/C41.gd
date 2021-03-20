extends Component
class_name C_41_ANY_POSITION

var value= Vector2(0,0)

func _ready() -> void:
	pass


func _init():
	name="C_41_ANY_POSITION"
 

func setPos(posPara):
	value = posPara



########################
# --- AUTODOC -------- #
########################
var  autodoc={
	"suggestion"  : "",
	"description" : "name of its fightingstyle",
	"validInputs" : [],
	"validType"   : dioJSONType_quack(),
	"nameToShow"  : "role description",
}
static func name_quack():      return "C_41_ANY_POSITION"
static func valueType_quack(): return "STRING"