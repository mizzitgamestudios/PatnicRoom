extends Component
class_name Comp_NPC_SkillBlock

var value = {}


func _init(var valuePara={}):
	name = "Comp_NPC_SkillBlock"
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
