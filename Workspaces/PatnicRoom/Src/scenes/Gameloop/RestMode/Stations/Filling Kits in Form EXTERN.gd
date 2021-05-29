extends Node
class_name KitSelectioneXTERN
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
