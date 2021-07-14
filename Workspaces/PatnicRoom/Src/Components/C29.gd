extends Component
class_name C_29_ANY_LISTING_PRICE

var value: int

func _init(valuePara):
	name = "C_29_ANY_LISTING_PRICE"
	value = valuePara



########################
# --- AUTODOC -------- #
########################
static func getAutoDoc(): return{
	"suggestion"  : "",
	"description" : "the usual price when its bought",
	"validInputs" : [],
	"validType"   : dioJSONType_quack(),
	"nameToShow"  : "listing price",
}
static func name_quack():      return "C_29_ANY_LISTING_PRICE"
static func dioJSONType_quack(): return "INTEGER"
