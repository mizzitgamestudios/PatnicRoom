extends Object
class_name _011_CharLoader


# ----- INITIALICE ----------------------------------------------------------- ##

var attributePreset : String
var skillPreset     : String
var dictOfChar      : Dictionary

var charToLoad      : PlayerEntity

var compsToAppend   = []
var valuesOfComps   = []

func setCurrentCharByDict(dictOfCharPara:Dictionary):
	charToLoad = PlayerEntity.new()
	self.dictOfChar = dictOfCharPara
	freePreviousChar()
	

	cacheGenerall()
	loadGenerall()

	loadStreetName()
	loadGear()
	loadKitventory()
	loadIndirectStats()	
	charToLoad.addComponent( C_53_Actor_SELECTED_TILE.new() )
	
	API_006_Player.currentChar = charToLoad
	

func freePreviousChar():
	if API_006_Player.currentChar != null:  API_006_Player.currentChar.free()



# ----- PROCESS -------------------------------------------------------------- ##

# ---- Generall ---- #
func cacheGenerall():
	# PLAYERNAME
	valuesOfComps.append( dictOfChar["playerName"]  )
	compsToAppend.append( C_45_PLAYER_NAME          )
	# DESCRIPTION
	valuesOfComps.append( dictOfChar["description"] ) 
	compsToAppend.append( C_43_PLAYER_DESCRIPTION   )
	# ATTRIBUTES
	valuesOfComps.append( dictOfChar["attributes"]  )
	compsToAppend.append( C_19_ACTOR_ATTRIBUTES     )
	# SKILLS
	valuesOfComps.append( dictOfChar["skills"]      )
	compsToAppend.append( C_20_ACTOR_SKILLBLOCK     )
	# CREDITS
	valuesOfComps.append( dictOfChar["credits"]      )
	compsToAppend.append( C_9_CREDITS_ACCOUNT     )

func loadGenerall():
	for i in compsToAppend.size():

		var currentValue = valuesOfComps[i]
		var currentComp  = compsToAppend[i]

		charToLoad.addComponent( currentComp.new(currentValue) )




# ---- STREETNAME ---- #
func loadStreetName():
	var johnnyCache = dictOfChar["streetName"]
	if johnnyCache != "NULL":  charToLoad.addComponent( C_44_PLAYER_STREETNAME.new(johnnyCache) )

# ---- GEAR ---- #
func loadGear():
	var johnnyCache = GearEntity.new()
	
	for i in dictOfChar["Gear"].size():
		johnnyCache.addItem(dictOfChar["Gear"][i])
	
	charToLoad.addComponent(C_55_Gear.new())
	charToLoad.addComponent(C_51_PLAYER_KITSETS.new())

# ---- KITS ---- #
func loadKitventory():
	for i in dictOfChar["Kits"].size():
		
		if str(dictOfChar["Kits"][i][0]) != "NULL":
			var kitSetEnt = API_004_KitSet.addKitsetToPlayer(dictOfChar["Kits"][i])
			kitSetEnt.currentCooldownTime = kitSetEnt.cooldownTime
			charToLoad.getComp(C_51_PLAYER_KITSETS.name_quack()).addKitSet(kitSetEnt)

# ---- INDIRECT ---- #
func loadIndirectStats():
	var johnnyCache = charToLoad.getComp(C_19_ACTOR_ATTRIBUTES.name_quack())
	C_26_ACTOR_INDIRECT_STATS.new(johnnyCache,charToLoad)












