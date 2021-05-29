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
static func getAutoDoc(): return{
	"suggestion"  : "",
	"description" : "X and Y on the tilemap",
	"validInputs" : [],
	"validType"   : dioJSONType_quack(),
	"nameToShow"  : "position",
}
static func name_quack():      return "C_41_ANY_POSITION"
static func valueType_quack(): return "STRING"