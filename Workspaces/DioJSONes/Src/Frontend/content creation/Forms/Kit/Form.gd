extends Parent_Form


var timeslots   

var toDebug = false
var effectForm

func _ready() -> void:
	effectForm = load("res://Src/Frontend/content creation/Forms/Effect/Form.tscn").instance()
	.add_child(effectForm)




func checkAndSaveForm() -> void:
	effectForm.buildNodeReferences()
	Parser.cachedEffectSet = effectForm.getEffect()
	
	var dict = {}
	dict = Parser.buildGameElement()
	
	




