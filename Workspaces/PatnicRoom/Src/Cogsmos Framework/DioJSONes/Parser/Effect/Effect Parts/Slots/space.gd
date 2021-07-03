extends Component
class_name Effect_Comp_SPACE

var reach
var mTypeEnum
var source
var medium


func _init(dict:Dictionary):
	name = "Effect_Comp_SPACE"
	
	reach = dict["REACH"]
	
<<<<<<< HEAD
	var mType = ENUM.SOKRATILES.M_TYPE.get(dict["M_TYPE"])
	
	match mType:
		ENUM.SOKRATILES.M_TYPE.MEAT:	mTypeEnum = ENUM.SOKRATILES.M_TYPE.MEAT
		ENUM.SOKRATILES.M_TYPE.MATRIX:	mTypeEnum = ENUM.SOKRATILES.M_TYPE.MATRIX
		ENUM.SOKRATILES.M_TYPE.MAGIC:	mTypeEnum = ENUM.SOKRATILES.M_TYPE.MAGIC
	
	
	if SYNTAX.EFFECT.HAS_SPACE_SOURCE(dict["SOURCE"]):
		source = dict["SOURCE"]
	
		
	if SYNTAX.EFFECT.HAS_SPACE_MEDIUM(dict["MEDIUM"]):
=======
	var mType = ENUM.M_TYPE.get(dict["M_TYPE"])
	
	match mType:
		ENUM.M_TYPE.MEAT:	mTypeEnum = ENUM.M_TYPE.MEAT
		ENUM.M_TYPE.MATRIX:	mTypeEnum = ENUM.M_TYPE.MATRIX
		ENUM.M_TYPE.MAGIC:	mTypeEnum = ENUM.M_TYPE.MAGIC
	
	
	if Effect_Generator_Syntax.EFFECT_SPACE_SOURCE.has(dict["SOURCE"]):
		source = dict["SOURCE"]
	
		
	if Effect_Generator_Syntax.EFFECT_SPACE_MEDIUM.has(dict["MEDIUM"]):
>>>>>>> 14ed4bc523602584d0fecdfce3fc61f9ee8a2684
		medium = dict["MEDIUM"]



