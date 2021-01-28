extends Node
class_name Runner



var kitventory = Player.kitventory
var attributes : Comp_Actor_Attributes
var skills : Comp_NPC_SkillBlock
var TextureID : Comp_NPC_TileName
var inventory : Inventory
var indirectStats : Comp_NPC_IndirectStats
var team = Player.team
var cloudprinter = Player.cloudPrinter
var perk : String

	

func initialice():

	var chargenTemplate = Util.JSONParser.fileToDictionary("res://config/Runner/chargen presets.json")
	getAttributes(chargenTemplate)
	getSkillblock(chargenTemplate)
	getIndirectStats()
	getPerks()
	
	
	TextureID = Comp_NPC_TileName.new("General_0_5")
	
	kitventory = Player.kitventory # max 10 KitSetEntity
	team = Player.team




func getAttributes(chargenTemplate):
	var key = "attributes for "+Player.race
	attributes = Comp_Actor_Attributes.new(chargenTemplate[key])

func getSkillblock(chargenTemplate):
	var key = "skills for "+Player.race
	skills = Comp_NPC_SkillBlock.new(chargenTemplate[key])
	skills.modAllSkills(chargenTemplate[key])

func getIndirectStats():
	indirectStats = Comp_NPC_IndirectStats.new(self.attributes)


#IMPROVISED
func getPerks():
	match Player.perk:
		
		"astral inheritance":
			runAstralInheritance()
			perk = "astralInheritance" 
			
		"chiphead":
			perk = "chiphead"
			
		"the chosen one":
			perk = "chosen"
			
		"go big or go home":
			runGoBigOrGoHome()
			perk = "goBigOrGoHome"
			
		"deep pockets":
			perk = "deepPockets"



func runGoBigOrGoHome():
	if Util.RNG.getRandomNumber(0,100)>50:
		Player.common.credits += 50
	else:
		Player.common.credits = 0

func runAstralInheritance():
	pass

func runTheChosen():
	if Util.RNG.getRandomNumber(0,100)>50:
		pass
	else:
		pass

func runDeepPockets():
	pass



