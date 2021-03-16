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



########################
# --- AUTODOC -------- #
########################
const autodoc={
	"title":"relevant layer",
	"description":"descibes the most relevant layer of Tile",
	"className":"C_3_ANY_LAYER",
	"moduleName":"00_00 Basic Tile Components",
	"dataType":"String",
	"notable":"Needs to be a key of the naming convention 'ENUM.LAYERS_OF_EFFECT.SOKRATILES_LAYER'"
}
static func name_quack():      return "C_20_ACTOR_SKILLBLOCK"
static func dioJSONType_quack(): return "DICTIONARY"
