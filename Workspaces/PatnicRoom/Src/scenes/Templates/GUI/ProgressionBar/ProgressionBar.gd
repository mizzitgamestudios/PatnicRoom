extends Node2D

var progressionBefore = 50
var progressionAfter = 60
var progressionFillSteps = 500
var filledProgresswWidth
var filledProgressStep
var growBar
var achivedWidth

func _ready():
	# Get pos and width of full bar
	var fullBar = get_node("FullBar")
	var fullBarWidth = fullBar.rect_size.x
	
	# Set x width of before bar
	var acivedBar = get_node("AchivedProg")
	achivedWidth = fullBarWidth / 100 * progressionBefore
	acivedBar.rect_size.x = achivedWidth
	
	# Set x width of to grow bar
	var toGrowBar = get_node("ToGrowProg")
	filledProgresswWidth = fullBarWidth / 100 * progressionAfter 
	toGrowBar.rect_size.x = filledProgresswWidth
	
	growBar = get_node("GrowProg")
	growBar.rect_position.x += achivedWidth
	filledProgressStep = (filledProgresswWidth - achivedWidth) / progressionFillSteps
	
func _physics_process(delta):
	if (growBar.rect_size.x < (filledProgresswWidth -achivedWidth)):
		growBar.rect_size.x += filledProgressStep
	

