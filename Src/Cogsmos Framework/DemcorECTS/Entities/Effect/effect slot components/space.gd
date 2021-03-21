extends Component
class_name Effect_Comp_SPACE

var reach
var mTypeEnum
var source
var medium


func _init(dict:Dictionary):
	name = "Effect_Comp_SPACE"
	
	reach = dict["REACH"]
	

	match dict["M_TYPE"]:
		ENUM.M_TYPES.MEAT:
			mTypeEnum = ENUM.M_TYPES.MEAT
		ENUM.M_TYPES.MATRIX:
			mTypeEnum = ENUM.M_TYPES.MATRIX
		ENUM.M_TYPES.MAGIC:
			mTypeEnum = ENUM.M_TYPES.MAGIC
	
	
	if Effect_Generator_Syntax.EFFECT_SPACE_SOURCE.has(dict["SOURCE"]):
		source = dict["SOURCE"]
	
		
	if Effect_Generator_Syntax.EFFECT_SPACE_MEDIUM.has(dict["MEDIUM"]):
		medium = dict["MEDIUM"]



