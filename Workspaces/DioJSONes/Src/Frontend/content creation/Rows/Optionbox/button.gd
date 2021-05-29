extends Node2D

var nameRTL        : RichTextLabel 
var typeRTL        : RichTextLabel
var descriptionRTL : RichTextLabel 

var inputMarker    : Button 

var buttonContent = preload("res://Src/Frontend/content creation/Input/InputModules universal/dictionary/Dictionary.tscn").instance()
var fieldAttribute

func initialice(field:FormFieldAttributes,hintRTLPara:RichTextLabel):
	setUpNodesReferences()
	
	drawSeperator(field)
	setUpRTLRows(field)
	
	markInputField(field,hintRTLPara) 
	buttonContent.initialice(field)



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

	
	inputMarker.rect_position = Vector2(field.pos.x,field.pos.y)
	inputMarker.rect_size     = Vector2(100,field.size.y)
	
	inputMarker.add_stylebox_override("panel",field.style)






var isShown = false
func _on_input_button_up() -> void:
	isShown = !isShown
	if isShown: add_child(buttonContent)
	if !isShown: remove_child(buttonContent)




func setUpNodesReferences():
	nameRTL         = get_node("nameRTL")
	typeRTL         = get_node("typeRTL")
	descriptionRTL  = get_node("descriptionRTL")
	inputMarker     = get_node("input")

