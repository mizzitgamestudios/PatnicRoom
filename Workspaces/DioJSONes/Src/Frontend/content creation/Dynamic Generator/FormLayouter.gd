extends Node2D

var nameRTL        : RichTextLabel
var typeRTL        : RichTextLabel
var descriptionRTL : RichTextLabel

var inputMarker    : Panel    
var inputRTL        


func initialice(field:FormFieldAttributes,hintRTLPara:RichTextLabel):
	setUpNodesReferences()
	
	drawSeperator(field)
	setUpRTLRows(field)
	markInputField(field,hintRTLPara) 
	
	if field.validInputs.size() > 0:  get_node("inputPanel/input").initialice(field.validInputs)




func drawSeperator(field):
	var pos = Vector2(0,field.pos.y+10)
	get_node("separator").set_position(pos)



func setUpRTLRows(field):
	var posY                 = field.pos.y
	
	var row                  = [ nameRTL           ,  typeRTL                ,  descriptionRTL     ]
	var rowContent           = [ field.nameToShow  ,  field.dataTypeToString ,  field.description  ]
	var rowPos               = [ Vector2(008,posY) ,  Vector2(0250,posY)     ,  Vector2(1000,posY) ]
	
	for i in row.size():
		row[i].bbcode_text   = rowContent[i]
		row[i].rect_position = rowPos[i]



func markInputField(field,hintRTLPara):
	inputMarker.hintRTL       = hintRTLPara
	inputMarker.toolTip       = field.suggestion
	
	inputMarker.rect_position = field.pos
	inputMarker.rect_size     = field.size
	
	inputMarker.add_stylebox_override("panel",field.style)





func setUpNodesReferences():
	nameRTL          = get_node("nameRTL")
	typeRTL          = get_node("typeRTL")
	descriptionRTL   = get_node("descriptionRTL")
	inputMarker      = get_node("inputPanel")
	inputRTL         = get_node("inputPanel/input")
	inputRTL         = inputMarker.get_node("inputRTL")


