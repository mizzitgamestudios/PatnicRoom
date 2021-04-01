extends Component
class_name C_0_ANY_DESCRIPTION

var value: String

func _init(valuePara:String):
	self.name = "C_0_ANY_DESCRIPTION"
	value = valuePara

########################
# --- AUTODOC -------- #
########################
var autodoc={
	"suggestion"  : "something offensive or hyperbolic,best case both",
	"description" : "is shown to the player in things like mousehover or onlook-action",
	"validInputs" : [],
	"validType"   : dioJSONType_quack(),
	"nameToShow"  : "lore-description",
}
static func name_quack():      return "C_0_ANY_DESCRIPTION"
static func dioJSONType_quack(): return "STRING"
