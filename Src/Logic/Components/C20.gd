extends Component
class_name C_20_ACTOR_SKILLBLOCK

var value = {}


func _init(var valuePara={}):
	name = "C_20_ACTOR_SKILLBLOCK"
	value = createSkillList()

	

func modAllSkills(dict):
	for i in dict.size():
		if value.has(dict.keys()[i]):
			var cache = dict.keys()[i]
			var valueCache = dict[cache]
			value[cache] = valueCache
		

func setSkillblock(dict):
	value = dict


static func createSkillList():
	var allSkillsList = {}
	
	for i in ENUM.SKILL.size():
		allSkillsList[ENUM.SKILL.keys()[i]] = 0
	
	return allSkillsList


static func name_quak():
	return "C_20_ACTOR_SKILLBLOCK"
	
	
	
	
	
	
	
	