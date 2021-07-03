extends Component
<<<<<<< HEAD
class_name C_50_ACTOR_ROLE_DESCRIPTION

var value 

func _init(valuePara):
	name="C_50_ACTOR_ROLE_DESCRIPTION"
	value=valuePara



########################
# --- AUTODOC -------- #
########################
static func getAutoDoc(): return{
	"suggestion"  : "",
	"description" : "like description a flavor-text",
	"validInputs" : [],
	"validType"   : dioJSONType_quack(),
	"nameToShow"  : "role description",
}
static func name_quack():      return "C_50_ACTOR_ROLE_DESCRIPTION"
static func dioJSONType_quack(): return "STRING"
=======
class_name C_50_Player_Selected_Tiles

var value: String

func _init(valuePara:String):
	name = "C_50_Player_Selected_Tiles"
	value = valuePara


static func getAutoDoc(): return{
	"suggestion"  : "",
	"description" : "tiles affected by kit",
	"validInputs" : [],
	"validType"   : dioJSONType_quack(),
	"nameToShow"  : "selected tiles",
}
>>>>>>> 14ed4bc523602584d0fecdfce3fc61f9ee8a2684
