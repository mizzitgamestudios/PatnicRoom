extends Component
class_name C_3_ANY_LAYER

var value: String

func _init(valuePara:String):
	self.name = "C_3_ANY_LAYER"
	value = valuePara



########################
# --- AUTODOC -------- #
########################
var  autodoc={
	"suggestion"  : "",
	"description" : "determinds on which layer the entity is indexed on Map",
	"validInputs" : ["actors","pc","Meat ground","Meat interactables","Matrix ground","Matrix interactables","Magic ground","Magic interactables","selection","condition"],
	"validType"   : "validInputs",
	"nameToShow"  : "Layer",
}
static func name_quack():      return "C_3_ANY_LAYER"
static func dioJSONType_quack(): return "STRING"
