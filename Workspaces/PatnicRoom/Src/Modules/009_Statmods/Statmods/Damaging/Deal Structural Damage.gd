extends Object
class_name U_DEAL_STRUCTURAL_DAMAGE


var damage  : int

func _init(dictOfPara:Array):
	damage  = dictOfPara[0]


func getValueToString_quack():  return "deal "+str(damage)+" structural damage"
func getName_quack():      
	return "U_DEAL_STRUCTURAL_DAMAGE"

func getParameter_quack(): 
	return {
		 "damage"  : damage
	}




func run(ent):
	for currentEnt in ent:
		currentEnt.getComp("C_8_STRUCTURE_HP").value -= damage
		
		if currentEnt.getCompValue("C_8_STRUCTURE_HP") <= 0:
			currentEnt.getComp("C_2_ANY_TEXTURE_ID").value = "Suburban_0_2"
			currentEnt.getComp("C_1_ANY_IS_WALKABLE").value = true
		
		API_002_Tilemap.appendDirtyTiles(currentEnt)

 

static func getDoc():
	return {
		
		"toShort"          : "deal struct Damage",
		"keyword"          : "U_DEAL_STRUCTURAL_DAMAGE",
		"name"             : "Deal structural damage",

		"unit"             : "EFFECT",    
		"stat"             : "STAT_MOD",

		"toString"         : "Deal damage to interactables",

		"inputModule"      : "SLIDER"

	}
