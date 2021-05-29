extends Component
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
