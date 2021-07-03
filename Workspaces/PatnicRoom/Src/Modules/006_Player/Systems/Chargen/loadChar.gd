extends Object
class_name _011_CharLoader


# ----- INITIALICE ----------------------------------------------------------- ##

var attributePreset : String
var skillPreset     : String
var dictOfChar      : Dictionary



var compsToAppend   = []
var valuesOfComps   = []

func setCurrentCharByDict(dictOfCharPara:Dictionary):
	API_006_Player.currentChar = PlayerEntity.new()
	
	self.dictOfChar = dictOfCharPara
	#freePreviousChar()
	

	cacheGenerall()
	loadGenerall()
	
	API_006_Player.currentChar.stats.initialice(API_006_Player.currentChar)
	API_006_Player.currentChar.kitventory.initialice(API_006_Player.currentChar)
	API_006_Player.currentChar.inventory.initialice(API_006_Player.currentChar)

	loadStreetName()
	loadGear()
	loadGearedKitsets()
	loadIndirectStats()	
	API_006_Player.currentChar.addComponent( C_53_Actor_SELECTED_TILE.new() )
	
	
	

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
	# KITVENTORY
	valuesOfComps.append( "" )
	compsToAppend.append( C_68_KITVENTORY     )

func loadGenerall():
	for i in compsToAppend.size():

		var currentValue = valuesOfComps[i]
		var currentComp  = compsToAppend[i]
		var compInstance = currentComp.new(currentValue)

		API_006_Player.currentChar.addComponent( compInstance )




# ---- STREETNAME ---- #
func loadStreetName():
	var johnnyCache = dictOfChar["streetName"]
	if johnnyCache != "NULL":  API_006_Player.currentChar.addComponent( C_44_PLAYER_STREETNAME.new(johnnyCache) )

# ---- GEAR ---- #
func loadGear():
	var johnnyCache = API_006_Player.currentChar.inventory
	
	for i in dictOfChar["Gear"].size():
		johnnyCache.addItem(dictOfChar["Gear"][i])
	
	API_006_Player.currentChar.addComponent(C_55_Gear.new())
	API_006_Player.currentChar.addComponent(C_51_PLAYER_KITSETS.new())

# ---- KITS ---- #
func loadGearedKitsets():
	for i in dictOfChar["Kits"].size():
		if str(dictOfChar["Kits"][i][0]) != "NULL":
			
			var kitSetEnt = API_004_KitSet.addKitsetToPlayer(dictOfChar["Kits"][i])
			kitSetEnt.currentCooldownTime = kitSetEnt.cooldownTime
			API_006_Player.appendGearedKitSet(kitSetEnt)

# ---- INDIRECT ---- #
func loadIndirectStats():
	var johnnyCache = API_006_Player.currentChar.getComp(C_19_ACTOR_ATTRIBUTES.name_quack())
	C_26_ACTOR_INDIRECT_STATS.new(johnnyCache,API_006_Player.currentChar)












