<<<<<<< HEAD

# CLASS                                                                               
# BOOKMARK[epic=Parser] Common                                                        
extends Node
class_name JsonToEntityParser


var unparsableGameElements = []
var exceptionalParses = {}


# ----- MAIN ------------------------------------------------------------------------##


func parseGameData(allDictionaries:Array):
	exceptionalParses[5] = {}
	initialItteration(allDictionaries)
	followedUpDependants()
	exceptions()



func initialItteration(allDictionaries):
	for gameElementDict in allDictionaries:
		var entToFill = Entity.new()
		parseCurrentDict(gameElementDict,entToFill)


func followedUpDependants():
	while !unparsableGameElements.empty():
		for currentEntry in unparsableGameElements:
			parseCurrentDict(currentEntry)


func exceptions():
	for type in exceptionalParses.values():
		for entry in type.values():
		
			match entry["PARSER_EXCEPTION_MARKER"]:
				"NPC_TEMPLATE": addAsNPCTemplate(entry)
			



# ----- PARSING MODES ---------------------------------------------------------------##


func parseCurrentDict(toParse, entToFill:Entity=null):
	match getEnum(toParse):
		ENUM.DIOJSONES.GAME_ELEMENT_STATE.IS_TEMPLATE    : evaluateTemplate(toParse)
		ENUM.DIOJSONES.GAME_ELEMENT_STATE.NEEDS_TEMPLATE : addToQueue(toParse,entToFill)
		ENUM.DIOJSONES.GAME_ELEMENT_STATE.NO_TEMPLATE    : parseDictionary(toParse,entToFill)



# REVIEW   Waits till the next in line is ready, and does not check availabillty      
# REVIEW   of the Templates after it, potential in perfomance-increase                
# FUNC Checks if next Template is allready in the Game and waits/parses accordingly   
func evaluateTemplate(toParse:_DioJSON_Common_Template):
	if toParse.isNeededTemplateAvailable():
		toParse.setTemplateEnt()
		
		if toParse.areTemplatesFullfilled() :   unparsableGameElements.erase(toParse)
		else                                :   parseCurrentDict(toParse, toParse.entOfParse)



# FUNC Adds to waiting order till all needed Templates are Parsed   
func addToQueue(dictToCache:Dictionary, entToFill:Entity):
	var cache = _DioJSON_Common_Template.new(dictToCache,entToFill)
	unparsableGameElements.append(cache)



# FUNC Parses all Components   
func parseDictionary(toConvert:Dictionary, entToFill:Entity):
	#>>> Get current component <<<#
	var compsToString = toConvert.keys()
	var compsValues   = toConvert.values()
	
	for i in toConvert.size(): 
		var cachedCompMeta = _DioJSON_Common_Component.new( compsToString[i], compsValues[i] )
	
	
	#>>> Parse current component <<<#
		var NEEDED_PARSER = ENUM.DIOJSONES.NEEDED_PARSER
		
		match cachedCompMeta.neededParserEnum:

			#>>> Components <<<#
			NEEDED_PARSER.FLAG         :  addAsFlag(cachedCompMeta, entToFill)
			NEEDED_PARSER.SIMPLE       :  addAsComp(cachedCompMeta, entToFill)
			
			#>>> Custome Entities <<<#
			NEEDED_PARSER.EFFECT       :  addAsEffect(cachedCompMeta, entToFill)
			NEEDED_PARSER.LOOT_TABLE   :  addAsLootTable(cachedCompMeta, entToFill)
			
			#>>> Exceptions <<<#
			NEEDED_PARSER.NPC_TEMPLATE :  
				exceptionalParses[NEEDED_PARSER.NPC_TEMPLATE][toConvert.NAME] = toConvert 
				break
	
	
	DemokrECTS.initialiceNewEntry(entToFill)



# ----- SETTER ------------------------------------------------------------------------##


#>>> Components <<<#
func addAsComp(toParse, ent):   ent.addComponent( toParse.run() )

func addAsFlag(toParse, ent):   ent.addFlag( COMP.GET_FLAG(toParse.compToString) )



#>>> Custome Entities <<<#
func addAsEffect(toParse, ent):
	var cache     = toParse.run()
	var effectEnt = API_007_Effect.createEffectByDict(cache.value)
	var component = C_49_EFFECT_REFERENCE.new(effectEnt)
	ent.addComponent(component)

func addAsLootTable(toParse, ent):      pass # STUB   



#>>> Exceptions <<<#
func addAsNPCTemplate(toConvert):
	var cache = API_011_ProcgenActor.createActorTemplate(toConvert)
	API_001_Atlas.ActorTemplate().addEntity(cache)



# ----- HELPER ------------------------------------------------------------------------##


func getNeededParserEnum(): return ENUM.DIOJSONES.NEEDED_PARSER

func getEnum(toParse):
	if toParse is _DioJSON_Common_Template : return ENUM.DIOJSONES.GAME_ELEMENT_STATE.IS_TEMPLATE
	if COMP.HAS_DICT_TEMPLATE(toParse)     : return ENUM.DIOJSONES.GAME_ELEMENT_STATE.NEEDS_TEMPLATE
	else                                   : return ENUM.DIOJSONES.GAME_ELEMENT_STATE.NO_TEMPLATE



=======
extends Node
class_name JsonToEntityParser
# CLASS Hub for Interpreting JSON-Files of GameData :                 
# CLASS every Dataset is wrapped as an Object with a String-key       
# CLASS the String equals an entry of ENUM.JSON_KEY_TYPE              



# BOOKMARK JSON-Parser                                                           
var applyConditionsShorts = ["C_64"]
var applyConditions = ["C_64_APPLY_CONDITION_WALKING"]

func parse(dictionary : Dictionary) -> Entity:
	var ent : Entity = Entity.new()
	
	for entries in dictionary.size(): 
		
		var currentKey      = dictionary.keys()[entries]
		var currentValue    = dictionary.values()[entries]
		
		var compClass       = COMP.GET_BOTH(currentKey)
		if COMP.ATLAS_INDEX_COMP.has(currentKey):
			
			if compClass.dioJSONType_quack()   == "STRING"     : addAsSimpleComp (currentKey,        str        (currentValue),  ent)
			elif compClass.dioJSONType_quack() == "INTEGER"    : addAsSimpleComp (currentKey,        int        (currentValue),  ent)
			elif compClass.dioJSONType_quack() == "BOOLEAN"    : addAsSimpleComp (currentKey,        bool       (currentValue),  ent)
			
			elif compClass.dioJSONType_quack() == "ARRAY"      : addAsArrOrDict  (currentKey,                    currentValue ,  ent)
			elif compClass.dioJSONType_quack() == "DICTIONARY" : addAsArrOrDict  (currentKey,                    currentValue ,  ent)
			
			elif compClass.dioJSONType_quack() == "EFFECT"     : addAsEffect     (currentKey,                    currentValue ,  ent)
			elif compClass.dioJSONType_quack() == "TEMPLATE"   : addAsTemplate   (                               currentValue ,  ent)
			elif compClass.dioJSONType_quack() == "CONTAINER"  : addAsSimpleComp (currentKey, _recursiveSelfCall(currentValue),  ent)
			
			
		elif compClass is int                                :addAsFlag       (currentKey,                                    ent)
		else:
			for i in applyConditionsShorts.size():
				if currentKey.begins_with(applyConditionsShorts[i]):
					var component = COMP.GET_COMPONENT(applyConditions[i])
					component = component.new(currentValue)
					ent.addComponent(component)
		
	
	
	return DemokrECTS.initialiceNewEntry(ent)




# --- Basic --- #
func addAsSimpleComp(currentKey, currentValue, ent):
	var compConstructor = DioJSONes_SubParser_ComponentConstructor.new(currentKey, currentValue)
	var component = compConstructor.run()
	ent.addComponent(component)


func addAsArrOrDict(idx,currentDicEntry, ent):
	var compConstructor = DioJSONes_SubParser_ComponentConstructor.new(idx, currentDicEntry)
	var component = compConstructor.run()
	ent.addComponent(component)


func addAsEffect(idx,currentDicEntry, ent):
	var dicToBuildComp = currentDicEntry
	var compConstructor = DioJSONes_SubParser_ComponentConstructor.new(idx, dicToBuildComp)
	var component = compConstructor.run()
	ent.addComponent(component)


# --- Advanced Parsere --- #
func addAsTemplate(currentDicEntry, ent):
	var arrOfFilePaths = getArrayOfFilePathsParts(currentDicEntry)
	
	var templateName = ArrayOfFilePathsToString(arrOfFilePaths)
	var dict = DioJSONes.parseFromArray(arrOfFilePaths)
	
	var template = self._recursiveSelfCall(dict)
	ent.addTemplate(templateName,template[0])


func _recursiveSelfCall(dic) -> Array:
	var tmpEnt : Array = []
	
	if(typeof(dic) == TYPE_ARRAY):
		for arrayItem in dic:
			tmpEnt.append(self.getEntityOfRecursion(arrayItem))
	else:
		tmpEnt.append(self.getEntityOfRecursion(dic))
	return tmpEnt


func addAsFlag(idx, ent):
	ent.addFlag(COMP.ATLAS_FLAGS.get(idx))



	
################################################################################
##  --- GETTER ---                                                            ##
################################################################################

func getEntityOfRecursion(dicOfComp : Dictionary) -> Entity:
	var tmpEnt : Entity = self.parse(dicOfComp)
	return tmpEnt

func getArrayOfFilePathsParts(currentDicEntry):
	return [currentDicEntry.group, currentDicEntry.sup, currentDicEntry.value]

func ArrayOfFilePathsToString(arrOfFilePaths):
	return PoolStringArray(arrOfFilePaths).join(ENUM.ECTS_GROUP_DELIMETER)
>>>>>>> 14ed4bc523602584d0fecdfce3fc61f9ee8a2684
