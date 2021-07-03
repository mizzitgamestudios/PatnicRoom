extends Component
class_name C_38_KIT_PART_TYPE

var value

func _init(valuePara):
	name = "C_38_KIT_PART_TYPE"
<<<<<<< HEAD
	if valuePara is String: value = ENUM.KITS.PARTS.keys().find(valuePara)
	if valuePara is int: value = valuePara
=======
	value = valuePara
>>>>>>> 14ed4bc523602584d0fecdfce3fc61f9ee8a2684



########################
# --- AUTODOC -------- #
########################
static func getAutoDoc(): return{
	"suggestion"  : "Base: Main definition, Mod: Specialication, Appendix: Side-effect",
	"description" : "place in Kitset",
	"validInputs" : ["BASE","MOD","APPENDIX"],
	"validType"   : dioJSONType_quack(),
	"nameToShow"  : "kit Part",
}
static func name_quack():      return "C_38_KIT_PART_TYPE"
<<<<<<< HEAD
static func dioJSONType_quack(): return "STRING"
=======
static func dioJSONType_quack(): return "INTEGER"
>>>>>>> 14ed4bc523602584d0fecdfce3fc61f9ee8a2684
