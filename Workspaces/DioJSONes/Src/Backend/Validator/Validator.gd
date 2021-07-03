extends Node

var effectErrors
var componentErrors

var dictOfComps


func validate():
	setUp()
	
	checkComponents()
	checkEffect()
	
	Validator_Error_Marker.markErrors(componentErrors,effectErrors)
	
	return effectErrors.empty() and componentErrors.empty()


func checkComponents():
	for key in dictOfComps.keys():
		if dictOfComps[key] is String:  	checkString(key)
		if dictOfComps[key] is Dictionary:  checkDictionary(key)
		

func checkString(key):
	if dictOfComps[key] == "" or is_instance_valid(dictOfComps[key]): 
		componentErrors.append(key)

func checkDictionary(key):
	var cache = dictOfComps[key].values()
	for entry in cache: 
		if is_instance_valid(entry): componentErrors.append(key)







func checkEffect():
	var effect      = Parser_Kit.parse()
	var isTimeSlotSet = isAnyTimeSlotSet(effect["TIME"])
	
	if isTimeSlotSet:
		for i in effect.size():
			if timeSlotHasDuration(effect,i): 
				checkSlot(effect,str(i))
	
	
	else: effectErrors.append("NO_TIME_SLOT")
	Parser.dictForJSON = {}




func checkSlot(timeSlot,i:String):
	var unitToString  = ["SPACE","TRIGGER","EFFECT"]
	for currentUnit in unitToString:
		var baseString  = i +":"+ currentUnit +":"
		
		var unitInSlot  = currentUnit +"-"+ i
		var statsOfUnit = timeSlot[currentUnit][unitInSlot]
		
		if currentUnit == "SPACE"     : checkSpace(statsOfUnit,baseString)
		if currentUnit == "TRIGGER"   : checkTrigger(statsOfUnit,baseString)
		if currentUnit == "CONDITION" : checkCondition(statsOfUnit,baseString)


func timeSlotHasDuration(effect,i): return str(effect["TIME"]["TIME-"+str(i)]) != "N/A"

func isAnyTimeSlotSet(timeSlot):
	var isTimeSlotSet = false
	for currentSlot in timeSlot.keys(): if currentSlot != "N/A": isTimeSlotSet = true
	return isTimeSlotSet




func setUp():
	effectErrors       = []
	componentErrors    = []
	
	Parser.getGenerall()
	dictOfComps = Parser.dictForJSON
	Parser.dictForJSON = {}




func checkSpace(statsOfUnit,baseString):
	for currentStat in ["REACH","MEDIUM","M_TYPE","SOURCE"]: 
		if statsOfUnit[currentStat] == "": 
			effectErrors.append(baseString+currentStat)

func checkTrigger(statsOfUnit,baseString):
	if statsOfUnit["BASE"] == ""       : effectErrors.append(baseString+"BASE")
	if statsOfUnit["SPECIFIC"].empty() : effectErrors.append(baseString+"SPECIFIC")

func checkCondition(statsOfUnit,baseString):
	if statsOfUnit["CONDITION"].empty() and statsOfUnit["STAT_MOD"].empty(): 
		effectErrors.append(baseString+"X")
