extends Component
class_name _DioJSON_Common_Component


var compClass
var compToString

var compValue
var valueType

var neededParserEnum
var dictToParse


func _init(compNamePara, compValuePara, dictToParsePara):
	compToString = compNamePara
	compValue    = compValuePara
	dictToParse  =  dictToParsePara
	
	
	if COMP.HAS_COMPONENT(compNamePara):
		compClass = COMP.GET_BOTH(compNamePara)
		valueType = compClass.dioJSONType_quack()
		setValueType()
	
	elif COMP.HAS_FLAG(compNamePara):
		compClass        = COMP.GET_FLAG(compNamePara)
		valueType        = "N/A"
		neededParserEnum = ENUM.DIOJSONES.NEEDED_PARSER.FLAG
	
	elif COMP.HAS_TEMPLATE(compNamePara):
		compClass        = COMP.GET_TEMPLATE(compNamePara)
		valueType        = "N/A"
		neededParserEnum = ENUM.DIOJSONES.NEEDED_PARSER.TEMPLATE






func setValueType():
	match valueType:

		"STRING": 
			neededParserEnum = ENUM.DIOJSONES.NEEDED_PARSER.SIMPLE
			compValue        = str(compValue)

		"INTEGER": 
			neededParserEnum = ENUM.DIOJSONES.NEEDED_PARSER.SIMPLE
			compValue        = int(compValue)

		"BOOLEAN": 
			neededParserEnum = ENUM.DIOJSONES.NEEDED_PARSER.SIMPLE
			compValue        = bool(compValue)

		"ARRAY": 
			neededParserEnum = ENUM.DIOJSONES.NEEDED_PARSER.SIMPLE
			compValue        = Array(compValue)

		"DICTIONARY": 
			neededParserEnum = ENUM.DIOJSONES.NEEDED_PARSER.SIMPLE
			compValue        = Dictionary(compValue)


		"EFFECT"     : neededParserEnum = ENUM.DIOJSONES.NEEDED_PARSER.EFFECT
		"LOOT_TABLE" : neededParserEnum = ENUM.DIOJSONES.NEEDED_PARSER.LOOT_TABLE



		






func run():
	var compInst  = compClass.new(compValue)
	
	if is_instance_valid(compInst):  return compInst
	else                          :  print(compToString+" to Parse not found ")




