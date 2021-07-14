extends Node2D


var wholeEffectScene = []
var currentSlotShwon 

func _ready() -> void:
	for i in 4:
		var sceneToLoad  = load("res://Src/Frontend/content creation/Forms/Effect/SlotInputs.tscn").instance()
		sceneToLoad.initialice()
		wholeEffectScene.append(sceneToLoad)
	
	currentSlotShwon = wholeEffectScene[0]
	openSpawn()

func buildNodeReferences():
	for entry in wholeEffectScene:
		entry.initialice()


func openSpawn():    changeSlot(0)
func openOnset():    changeSlot(1)
func openEffect():   changeSlot(2)
func openOffset():   changeSlot(3)



func changeSlot(i): 
		remove_child(currentSlotShwon)
		currentSlotShwon = wholeEffectScene[i]
		add_child(currentSlotShwon)


func getEffect():
	var arrToReturn = []
	
	for currentSlot in wholeEffectScene:
		arrToReturn.append(currentSlot.getSlot())
	
	return arrToReturn


