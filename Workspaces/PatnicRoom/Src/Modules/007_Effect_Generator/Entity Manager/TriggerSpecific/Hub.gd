extends Object
class_name _02_TirggerSpecificHub


func manageSpecificTrigger(ent:KitSetEntity,collectedEnts:Array):
	var arrToReturn         = []
	var allSpecificTrigger  = ent.initialSelect["TRIGGER_SPECIFIC"].specificTriggers
	
	var cachedSelect
	for i in allSpecificTrigger.size():
		var currentEntry = allSpecificTrigger[i]
		
		if currentEntry is String:
			
			arrToReturn = getSelect(allSpecificTrigger[i+1],collectedEnts)
			
			if   currentEntry == "AND" : arrToReturn = reduceByKeyword(cachedSelect,arrToReturn)
			elif currentEntry == "OR"  : arrToReturn = appendByKeyword(cachedSelect,arrToReturn)
		
		
		else:   
			cachedSelect = getSelect(currentEntry,collectedEnts)
			if allSpecificTrigger.size() == 1 : arrToReturn = cachedSelect
	
	
	var cache = {}
	for entry in arrToReturn: 
		cache[entry.get_instance_id()] = entry
	
	return cache.values()	



func getSelect(specificTrigger,collectedEnts:Array):   return specificTrigger.run(collectedEnts)




func appendByKeyword(cache,arrToReturn):
	for currentEntry in cache:  arrToReturn.append(currentEntry)
	return arrToReturn


func reduceByKeyword(cache:Array,previousSelect:Array):
	var arrToReturn = []
	var toParse = []
	
	
	
	if cache.size() > previousSelect.size(): 
		toParse = previousSelect
	
	if cache.size() < previousSelect.size(): 
		toParse = cache
	
	for i in toParse.size():
		var cacheInstID    = cache[i-1].get_instance_id()
		var toReturnInstID = previousSelect[i-1].get_instance_id()
		
		if cacheInstID == toReturnInstID: arrToReturn.append(cache[i-1])
	
	return arrToReturn





func isInitialItteration(i): return i == 0

func isNextConnectorValid(itterationNr,allConnectors):  return allConnectors.size() != itterationNr
func isConnectorOr(itterationNr,allConnectors):         return allConnectors[itterationNr] == "OR"
func isConnectorAnd(itterationNr,allConnectors):        return allConnectors[itterationNr] == "AND"




