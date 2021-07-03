extends OptionButton
class_name MorphBox

var inputNode
var itemsToModule = []



func _ready() -> void:
	connect("item_selected",self,"_on_ItemSelected")


func fillFormModuleBySelectNr():
	for i in items.size():
		var currentItem = items[i]



func getModuleToMorph(index:int):
	var selectedItem = get_item_text(index)
	var doc = SYNTAX.INPUT_TO_KEYWORD(selectedItem)
	var syntax = SYNTAX.masterAtlas
	doc = syntax[doc]
<<<<<<< HEAD
	if doc.has("moduleName"):
	
		if doc["moduleName"] != "VOID":
			inputNode =Utils.getLoadedModule(doc["moduleName"]).instance()
			add_child(inputNode)
=======
	inputNode =Utils.getLoadedModule(doc["moduleName"]).instance()
	add_child(inputNode)
>>>>>>> 14ed4bc523602584d0fecdfce3fc61f9ee8a2684
	
	
	



func _on_ItemSelected(index:int) -> void:
	if  inputNode != null:  remove_child(inputNode)
	var filepath = getModuleToMorph(index)
	
	if filepath != null:
		inputNode = load(filepath).instance()
		add_child(inputNode)
	
	


func parseForInsert(list:Array):
	add_item("")
	for i in list.size():
		var currentEntry = list[i]
		add_item(str(currentEntry))


func getSelectToString():
	
	var selectedItem = self.get_selected_id()
	return get_item_text(selectedItem)



