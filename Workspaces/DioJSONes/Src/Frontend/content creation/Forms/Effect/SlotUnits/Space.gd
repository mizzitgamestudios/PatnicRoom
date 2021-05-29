extends Control
 
onready var reach 
onready var medium 
onready var source 
onready var mType
onready var length

var listOfInputs = ["","","",""]
var listOfMorphBox

func setUpNodeReferences() -> void:
	reach          = get_node("Reach/Panel/input")
	medium         = get_node("Medium/OptionButton")
	source         = get_node("Source/OptionButton")
	mType          = get_node("M-Type/OptionButton")
	length		  = get_node("Length/Panel2/input")
	listOfMorphBox = [reach,medium,source,mType]
	

func _ready() -> void:
	setUpNodeReferences()
	fillMorphBoxes()
	



func fillMorphBoxes():
	source.parseForInsert( SYNTAX.GET_SOURCE_TO_STRING() )
	medium.parseForInsert( SYNTAX.GET_MEDIUM_TO_STRING() )
	mType.parseForInsert(  SYNTAX.GET_M_TYPE_TO_STRING() )




func getUnits(effectCache:EffectCache):
	effectCache.spaceReach  = reach.getInputToString()
	effectCache.spaceMedium = medium.getInputToString()
	effectCache.spaceSource = source.getInputToString()
	effectCache.spaceMType  = mType.getInputToString()
	effectCache.spaceLength = length.getInputToString()
	return effectCache






