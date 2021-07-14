extends Node
class_name Injectables_AddToScene

var filepathToScene:String 
var rootOfScene

func initialice(filepathPara:String,dependeant):
	filepathToScene = filepathPara
	rootOfScene = dependeant.get_tree().get_current_scene()

func run():
	var loadOfScene = load(filepathToScene)
	var instanceOfScene = loadOfScene.instance()
	rootOfScene.add_child(instanceOfScene)

