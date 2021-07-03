extends OptionButton


var inputNode
var itemsToModule = []



func _ready() -> void:
	connect("item_selected",self,"_on_ItemSelected")


func fillFormModuleBySelectNr():
	for i in items.size():
		var currentItem = items[i]


func _on_ItemSelected(index:int) -> void:
	pass
	
	


func parseForInsert(list:Array):
	add_item("")
	for i in list.size():
		var currentEntry = list[i]
		add_item(str(currentEntry))


func getInputToString():
	
	var selectedItem = self.get_selected_id()
	return get_item_text(selectedItem)



