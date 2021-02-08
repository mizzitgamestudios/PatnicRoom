extends Object
class_name _011_CharLoader


var attributePreset: String
var skillPreset: String


var dictOfChar: Dictionary
var charToLoad := PlayerEntity.new()

func setCurrentCharByDict(dictOfChar:Dictionary):
	self.dictOfChar = dictOfChar
	freePreviousChar()
	
	loadGenerall()
	loadAttributes()
	loadSkill()
	loadGear()
	loadKitventory()
	loadIndirectStats()
	
	API_011_Player.currentChar = charToLoad
	


func freePreviousChar():
	if API_011_Player.currentChar != null:
		API_011_Player.currentChar.free()





########################
# --- Generall ------- #
########################
func loadGenerall():
	var johnnyCache: String

	# Playername
	johnnyCache = dictOfChar["playerName"]
	charToLoad.playerName = Comp_Player_Playername.new(johnnyCache)

	# Streetname
	johnnyCache = dictOfChar["streetName"]
	if johnnyCache != "NULL":
		charToLoad.streetName = Comp_Player_Streetname.new(johnnyCache)
	
	# Description
	johnnyCache = dictOfChar["description"]
	charToLoad.description = Comp_Player_Description.new(johnnyCache)

	# Attributes preset
	johnnyCache = dictOfChar["I am..."]
	attributePreset = johnnyCache

	# Skill preset
	johnnyCache = dictOfChar["I can..."]
	skillPreset = johnnyCache
	
	

########################
# --- Attributes ----- #
########################	
func loadAttributes():
	var johnnyCache = dictOfChar["attributes"]
	charToLoad.attributes = Comp_Actor_Attributes.new(johnnyCache)



########################
# --- Skills --------- #
########################
func loadSkill():
	charToLoad.skills = Comp_NPC_SkillBlock.new(dictOfChar["skills"])
	charToLoad.skills.modAllSkills(dictOfChar)



########################
# --- Gear ----------- #
########################
func loadGear():
	var johnnyCache = GearEntity.new()
	
	for i in dictOfChar["Gear"].size():
			johnnyCache.addItem(dictOfChar["Gear"][i])
	
	charToLoad.inventory = johnnyCache



########################
# --- Kits ----------- #
########################
func loadKitventory():
	var kitKon = KitSetConstructor.new()
	for i in dictOfChar["Kits"].size():
		var currentKitSetToString = dictOfChar["Kits"][i].values()
		var kitSetEnt = kitKon.constructByArraYKitPart(currentKitSetToString)
		
		charToLoad.kitsSets.addKit(kitSetEnt)


		
########################
# --- Indirect ------- #
########################		
func loadIndirectStats():
	charToLoad.indirectStats = Comp_NPC_IndirectStats.new(charToLoad)




