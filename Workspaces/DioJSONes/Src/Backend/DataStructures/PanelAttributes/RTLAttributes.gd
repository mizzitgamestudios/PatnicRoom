extends FormFieldAttributes
class_name RTLAttributes


func _init(currentComp,sceneInstance,i):  
	self.initialice(currentComp,sceneInstance,i)
	self.inputNode = self.scene.get_node("inputPanel/input")


func getInputToString():  
	return self.inputNode.bbcode_text
