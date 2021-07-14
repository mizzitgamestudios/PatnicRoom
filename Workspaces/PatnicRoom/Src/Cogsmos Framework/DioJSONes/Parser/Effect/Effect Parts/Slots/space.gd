extends Component
class_name Effect_Comp_SPACE

var reach
var mTypeEnum
var source
var medium


func _init(dict:Dictionary):
	name = "Effect_Comp_SPACE"
	
	reach = dict["REACH"]
	
	var mType = ENUM.SOKRATILES.M_TYPE.get(dict["M_TYPE"])
	
	match mType:
		ENUM.SOKRATILES.M_TYPE.MEAT:	mTypeEnum = ENUM.SOKRATILES.M_TYPE.MEAT
		ENUM.SOKRATILES.M_TYPE.MATRIX:	mTypeEnum = ENUM.SOKRATILES.M_TYPE.MATRIX
		ENUM.SOKRATILES.M_TYPE.MAGIC:	mTypeEnum = ENUM.SOKRATILES.M_TYPE.MAGIC
	
	
	if SYNTAX.EFFECT.HAS_SPACE_SOURCE(dict["SOURCE"]):
		source = dict["SOURCE"]
	
		
	if SYNTAX.EFFECT.HAS_SPACE_MEDIUM(dict["MEDIUM"]):
		medium = dict["MEDIUM"]



