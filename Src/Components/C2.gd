extends Component
class_name C_2_ANY_TEXTURE_ID

var value: String

func _init(valuePara:String):
	self.name = "C_2_ANY_TEXTURE_ID"
	value = String(valuePara)


########################
# --- AUTODOC -------- #
########################
var  autodoc={
	"suggestion"  : "*tilesetname*_*rownumber*_*collumnumber*",
	"description" : "Name of the Texture to be shown",
	"validInputs" : [],
	"validType"   : dioJSONType_quack(),
	"nameToShow"  : "Texture-ID",
}
static func name_quack():      return "C_2_ANY_TEXTURE_ID"
static func dioJSONType_quack(): return "STRING"

