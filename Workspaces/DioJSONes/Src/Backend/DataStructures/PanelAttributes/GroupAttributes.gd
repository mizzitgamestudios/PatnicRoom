extends FormFieldAttributes
class_name GroupAttributes


func _init(currentComp,sceneInstance,i):  
	self.initialice(currentComp,sceneInstance,i)
	


func getInputToString():  
	var dictToReturn = {}
	var test = scene.buttonContent.entriesMeta
	
	for entry in test:
		dictToReturn[entry["name"]] = entry["scene"].get_node("entry1/inputField/inputRTL").inputContent
	
	
	return dictToReturn
