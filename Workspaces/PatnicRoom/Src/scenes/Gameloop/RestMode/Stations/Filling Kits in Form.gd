extends Node
class_name KitSelection

var currentKit: String
var kitFilePaths = {
	"layerIndex":{
		"Infusions":"magic",
		"Meeles":"meat",
		"Droness":"matrix"
	},
	"magic":{
		"symbols":[
			"res://Media/GUI/KitSymbols/Infusion.png",
			"res://Media/GUI/KitSymbols/Spell.png",
			"res://Media/GUI/KitSymbols/Rite.png"],
		
		"names"      : ["Infusions","Spells","Rites"],
		"Infusions"     : ["Motive","B","Appendix"],
		"Spells"       : ["Form","Medium","Appendix"],
		"Rites"     : ["Element","Behaviour","Appendix"],
	},
	"meat":{
		"symbols":[
			"res://Media/GUI/KitSymbols/Meele.png",
			"res://Media/GUI/KitSymbols/Gun.png",
			"res://Media/GUI/KitSymbols/Armor.png"],
			
		"names"      : ["Meeles","Guns","Armors"],
		"Meeles"     : ["Shaft","Hitzone","Appendix"],
		"Guns"       : ["Frame","Ammunition","Appendix"],
		"Armors"     : ["Coating","Matterial","Appendix"],
	},
	"matrix":{
		"symbols":[
			"res://Media/GUI/KitSymbols/Drones.png",
			"res://Media/GUI/KitSymbols/Hacks.png",
			"res://Media/GUI/KitSymbols/Drones.png"],
			
		"names"      : ["Droness","Hacks","Drones"],
		"Droness" : ["Modell","Integration","Appendix"],
		"Hacks"      : ["Codebase","Target","Appendix"],
		"Drones"     : ["Chassis","Movement","Appendix"],
	}
}

var pre = "[color=white]"
var post = "[/color]"
func fillCategoryNodes(category: Dictionary, scene: Node2D):
	scene.get_node("one/text").bbcode_text = pre+category["names"][0]+post
	scene.get_node("two/text").bbcode_text = pre+category["names"][1]+post
	scene.get_node("three/text").bbcode_text = pre+category["names"][2]+post
	
	
	setKitSymbol(category,scene)
	


func setKitSymbol(category: Dictionary, scene: Node2D):
	var kitSymbol : TextureRect = scene.get_node("one/texture")
	var texture : Texture = load( category["symbols"][0] )
	kitSymbol.texture = texture
	
	kitSymbol = scene.get_node("two/texture")
	texture = load(category["symbols"][1])
	kitSymbol.texture = texture
	
	kitSymbol = scene.get_node("three/texture")
	texture = load(category["symbols"][2])
	kitSymbol.texture = texture









func fillAllModulesForKits(node):
	currentKit = saniticeCurrentKit(node.bbcode_text)
	lockNodeIntoSelect(node)
	var rootNode = node.get_node("../../..")
	
	var layer = getLayerByKitCat(rootNode)
	var modules = getAllModulesByKitCat(currentKit,layer)
	insertModulesToTexts(rootNode,modules)
	
	var test=node.get_node("root_KitBase/Module Title/text")


func lockNodeIntoSelect(node):
	node.bbcode_text ="[color=yellow]"+saniticeCurrentKit(node.bbcode_text)+"[/color]"

func getAllModulesByKitCat(kitName,layer):
	return kitFilePaths[layer][kitName]

func insertModulesToTexts(node,modules):
	node.get_node("root_KitBase/Module Title/text").bbcode_text=modules[0]
	
	node.get_node("root_KitMod/Module Title/text").bbcode_text=modules[1]
	node.get_node("root_KitAppend/Module Title/text").bbcode_text=modules[2]

	


func saniticeCurrentKit(string : String) -> String:
	return string.split("]")[1].split("[")[0]

func getLayerByKitCat(node):
	var firstEntry = node.get_node("root_KitBase/one/text").bbcode_text
	firstEntry = saniticeCurrentKit(firstEntry)
	return kitFilePaths["layerIndex"][firstEntry]





