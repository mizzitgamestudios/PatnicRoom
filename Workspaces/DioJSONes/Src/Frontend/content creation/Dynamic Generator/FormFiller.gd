extends Node
class_name FormFiller




var formRoot:         Node2D
var hintRTIL:         RichTextLabel


func _init(formRootPara) -> void:
	formRoot           = formRootPara
	hintRTIL           = formRoot.get_node("debug/explain/RichTextLabel")
	
	fillForm()
	setGUI()


var mandatoryToFill:Dictionary
func fillForm():
	var compsToFill      =  Utils.componentsToLoad["mandatory to fill out"]
	var attributesToFill  = Utils.getCompDocsOfArray(compsToFill)
	Parser.componentsAttributesClasses.clear()
	
	for i in attributesToFill.size():
		var currentComp  = attributesToFill[i]
		
		var sceneInstance    = Utils.getSceneInstanceByComp(currentComp)
		
		var loadedAttributes = Utils.getAttributesClassByComp(currentComp)
		var currentFormField = loadedAttributes.new(currentComp,sceneInstance,i)
		
		sceneInstance.initialice(currentFormField, hintRTIL)
		formRoot.add_child(sceneInstance)
		
		Parser.componentsAttributesClasses.append(currentFormField)



func setGUI():
	var posXForCollumn   = [400, 550, 700]
	var marginX          = 40
	var marginY          = 70
	
	var lastPosY  = Parser.componentsAttributesClasses.back().pos.y
	
	setOverhead(marginY, lastPosY)
	setCollumns(marginX, posXForCollumn, lastPosY)




func setOverhead(marginY,lastPosY):
	var wrapperX     = 1730
	var wrapperY     = lastPosY + marginY
	var wrapperV2    = Vector2(wrapperX, wrapperY)
	
	formRoot.get_node("gui/overhead").set_size(wrapperV2)


func setCollumns(marginX, posXForCollumn, lastPosY):
	for i in posXForCollumn.size():
		var collumnNode = formRoot.get_node( "gui/collumn"+str(i) )
		
		var collumnY  = lastPosY+marginX
		var collumnX  = posXForCollumn[i]
		var collumnV2 = Vector2(collumnX, collumnY)
		
		collumnNode.set_size(collumnV2)

