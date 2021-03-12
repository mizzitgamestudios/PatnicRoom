extends Object
class_name _011_StateManagaer_Interface


#----- INITIALICE ------------------------------------------------------------##

var isRoot            : bool
var isSame            : bool

var panelNode         : Node 
var sidepanelInstance

var sidepanelsToLoadByAction: Dictionary = {
	"Panic_Info_Kits" : "res://Src/scenes/Gameloop/PanicMode/Subscenes/Kits Side Panel/Kits.tscn",
	"Panic_Info_Jur"  : "res://Src/scenes/Gameloop/PanicMode/Subscenes/Inv Side Panel/Inv.tscn",
	"Panic_Info_Mon"  : "res://Src/scenes/Gameloop/PanicMode/Subscenes/Monitor Side Panel/Monitor.tscn",
	"Panic_Info_News" : "res://Src/scenes/Gameloop/PanicMode/Subscenes/News Side Panel/News.tscn",
}


func _init(panelNodePara:Node) -> void:
	self.panelNode = panelNodePara

	#Signals.connect("animationFinished",self,"backToMenue")
	#Signals.connect("animationDeleted",self,"addToScene")



#----- INPUT HANDLER ---------------------------------------------------------##

func manageSidepanel(inputAction:String):
	if isRoot:
		sidepanelInstance = instanciateSidePanelAction(inputAction)
		addToScene()

	elif isSame:  pass
	
	else:
		playExitAnimation()
		selfDestruct()
		sidepanelInstance = instanciateSidePanelAction(inputAction)
		addToScene()

		
		
#----- HELPER ----------------------------------------------------------------##

func addToScene():
	panelNode.get_node("SidePanel").add_child(sidepanelInstance)

func instanciateSidePanelAction(inputAction:String):
	if sidepanelsToLoadByAction.keys().has(inputAction):
		var loadInfoPackage = load(sidepanelsToLoadByAction[inputAction])
		return loadInfoPackage.instance()



#func backToMenue():
#	Signals.emit_signal("selfDestruct")
#	Signals.emit_signal("animationDeleted")


func playExitAnimation():
	panelNode.get_node("SidePanel").get_child(0).exitAnimation()


func selfDestruct():
	var allInstances=[]
	Signals.emit_signal("selfDestruct",allInstances)
	
	for i in allInstances.size():
		allInstances[i].free()
		
	









