extends Object
class_name U_DEAL_PLAIN_DAMAGE


var damage  : String

func _init(dictOfPara:Array):
	damage  = dictOfPara[0]


func getValueToString_quack():  return "deal "+str(damage)+" plain damage"
func getName_quack():      
	return "U_DEAL_PLAIN_DAMAGE"

func getParameter_quack(): 
	return {
		 "damage"  : damage
	}



func run(ent):
	if ent is ActorEntity:

		ent.getComp("C_57_HITPOINTS").value = ent.getComp("C_57_HITPOINTS").value + int(damage)
		
		var value = ent.hitpoints()

		if value <= 0: 
			API_011_ProcgenActor.removeActorFromGame(ent)

		
 



static func getDoc():
	return {
		
		"toShort"          : "deal bio Damage",
		"keyword"          : "U_DEAL_PLAIN_DAMAGE",
		"name"             : "Deal plain damage",

		"unit"             : "EFFECT",    
		"stat"             : "STAT_MOD",

		"toString"         : "Deal damage to actors",

		"inputModule"      : "SLIDER"

	}
