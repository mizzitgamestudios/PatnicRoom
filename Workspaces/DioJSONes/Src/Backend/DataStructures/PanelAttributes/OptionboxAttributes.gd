extends FormFieldAttributes
class_name OptionboxAttributes


func _init(currentComp,sceneInstance,i):  
	self.initialice(currentComp,sceneInstance,i)
	self.inputNode = scene.get_node("inputPanel/input")


func getInputToString():  
	return self.inputNode.get_item_text(self.inputNode.selected)
