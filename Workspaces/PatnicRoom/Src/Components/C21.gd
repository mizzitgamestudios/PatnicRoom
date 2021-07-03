extends Component
class_name C_21_TILE_TILENAME

var value

func _init(valuePara):
	name = "C_21_TILE_TILENAME"
	value = valuePara



########################
# --- AUTODOC -------- #
########################
static func getAutoDoc(): return{
	"suggestion"  : "often the same as C_6, maybe shorter",
	"description" : "often used Reference name",
	"validInputs" : [],
	"validType"   : dioJSONType_quack(),
	"nameToShow"  : "Name",
}
static func name_quack():      return "C_21_TILE_TILENAME"
static func dioJSONType_quack(): return "STRING"
