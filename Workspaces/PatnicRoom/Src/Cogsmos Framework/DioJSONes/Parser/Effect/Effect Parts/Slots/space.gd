extends Component
class_name Effect_Comp_SPACE

var reach
var mTypeEnum
var source
var medium


func _init(dict:Dictionary):
	name = "Effect_Comp_SPACE"
	
	reach = dict["REACH"]
	
	var mType = ENUM.M_TYPE.get(dict["M_TYPE"])
	
	match mType:
		ENUM.M_TYPE.MEAT:	mTypeEnum = ENUM.M_TYPE.MEAT
		ENUM.M_TYPE.MATRIX:	mTypeEnum = ENUM.M_TYPE.MATRIX
		ENUM.M_TYPE.MAGIC:	mTypeEnum = ENUM.M_TYPE.MAGIC
	
	
	if Effect_Generator_Syntax.EFFECT_SPACE_SOURCE.has(dict["SOURCE"]):
		source = dict["SOURCE"]
	
		
	if Effect_Generator_Syntax.EFFECT_SPACE_MEDIUM.has(dict["MEDIUM"]):
		medium = dict["MEDIUM"]



