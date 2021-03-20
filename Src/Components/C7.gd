extends Component
class_name C_7_TILE_STATIC_TILESET_NR

var value: int

func _init(valuePara:int):
	name = "C_7_TILE_STATIC_TILESET_NR"
	value = int(valuePara)



########################
# --- AUTODOC -------- #
########################
var  autodoc={
	"suggestion"  : "",
	"description" : "Number of tile in Master-atlas",
	"validInputs" : [],
	"validType"   : dioJSONType_quack(),
	"nameToShow"  : "static Tileset Number (do not fill)",
}
static func name_quack():      return "C_7_TILE_STATIC_TILESET_NR"
static func dioJSONType_quack(): return "INTEGER"
