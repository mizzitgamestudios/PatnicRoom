extends Node

var configFilepath = "res://config/debugKitsAtStart.json"
var kitsToStart

func _ready() -> void:
	kitsToStart = Util.JSONParser.fileToDictionary(configFilepath)["kitsAtStart"]
	if kitsToStart.size() <= 7: 
		
		var nodeNr = 0
		var injectable = Injectables_AddToScene.new()
		for kitset in kitsToStart:
			nodeNr += 1
			
			var kitsetNode = get_node("Panel/kitset"+str(nodeNr))
			
			var baseNode = kitsetNode.get_node("base")
			var modNode = kitsetNode.get_node("mod")
			var appNode = kitsetNode.get_node("app")
			
			baseNode.initialice(injectable,"")
			modNode.initialice(injectable,"")
			appNode.initialice(injectable,"")
			
			
			if kitset[0] != "NULL" : baseNode.changeContent(kitset[0], true)
			if kitset[1] != "NULL" : modNode.changeContent(kitset[1], true)
			if kitset[2] != "NULL" : appNode.changeContent(kitset[2], true)




