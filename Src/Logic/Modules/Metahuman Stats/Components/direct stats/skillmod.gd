extends Component
class_name Comp_NPC_SkillBlock

var value = {}
var cache = {}

func _init(var valuePara={}):
	name = "Comp_NPC_SkillBlock"
	value = Util.DictionaryUtils.convertArrayToDictionary(getSkillList(),0)
	cache = valuePara
	

func modAllSkills(dict):
	value = Util.DictionaryUtils.use(value,"increment",dict)


static func getSkillList():
	var allSkillsList = [
	"Diving",
	"Free-fall",

	"Pistols",
	"Automatics",
	"Longarms",
	"Exotic Ranged Weapons",
	"Gunnery",
	"Heavy Weapons",

	"Clubs",
	"Blades",
	"Throwing Weapons",
	"Unarmed Combat",
	"Exotic Meele Weapons",

	"Locksmith",
	"Palming",

	"Gymnastcis",
	"Sneaking",

	"Pilot Aerospace",
	"Pilot Walker",
	"Pilot Aircraft",
	"Pilot Exotic",
	"Pilot Groundcraft",
	"Pilot Watercraft",

	"Running",
	"Swimming",

	"Survival",
	"Astral Combat",

	"Arcana",
	"Mechanic",
	"Chemistry",
	"First Aid",
	"Medicine",
	"Armorer",
	"Biotechnology",
	"Computer",
	"Cybercombat",
	"Electronic Warfare",
	"Software",

	"Artisan",
	"Disguise",
	"Perception",
	"Assensing",
	"Navigation",

	"Con",
	"Leadership",
	"Animal Handling",
	"Ettiquette",
	"Intimidation",
	"Negotiation",
	"Impersonation",
	]
	return allSkillsList
