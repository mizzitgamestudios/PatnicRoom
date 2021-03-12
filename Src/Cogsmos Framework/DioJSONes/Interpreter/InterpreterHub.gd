extends Node
class_name DioJSONes_Interpreter

var method: String
var parameter: String
func manageKeywords(keyword:String, value:String):
	if hasParameter(keyword):
		cacheBoth(keyword)
	else:
		cacheSingle(keyword)
	
	match method:
		"REF":                            #REF = REFerence to Template
			return runTemplate(value)
		"RNG":                            #RNG = Random Number Generation by dicetoss (W2/W4/W6/W8/W12/W20)
			return runRNG()
		"PRC":                            #PRC = PeRCent probabillity
			return runPercent(value)
		"TMS":                            #TMS = TiMeS of thing
			return runTemplate(value)


func hasParameter(keyword):
	return keyword.split(" ").size()==2

func cacheBoth(keyword):
	var cache = keyword.split(" ")
	method = cache[0]
	parameter = cache[1]
func cacheSingle(keyword):
	method = keyword
	parameter=""
	
	
###########
##  REF  ##
###########
func runTemplate(string):
	pass
###########
##  RNG  ##
###########
var singleDigit: int
var tenthDigit: int
var i=0
func runRNG() -> int:
	var RNGDigit: String = parameter[i+2]
	var operand: String  = parameter[i+4]
	var diceSize: String = parameter[i+3]
	
	
	if isDoubleDigit(parameter,i+1):
		tenthDigit = int(parameter[i])*10
		singleDigit = int(parameter[i+1])
	else:
		tenthDigit = 0
		singleDigit = int(parameter[i])
	
	
	var RNGFactor: int = singleDigit + tenthDigit
	var RNGsum: int = getRng(diceSize,RNGFactor)
	var RNGString = str(RNGFactor)+ str(RNGDigit)+ str(diceSize)+ str(operand)
	
	
	var staticMod: String = parameter.split(RNGString)[1]
	
	var result: int = calculateResult(RNGsum,staticMod,operand)
	return result


func isDoubleDigit(parameter:String, i:int) -> bool:
	return parameter[i]!="+" or parameter[i]!="-" or parameter[i]!="*" or parameter[i]!="/" or parameter[i]!="w"

func getRng(diceSize,RNGFactor) -> int:
	var RNGsum=0
	for i in RNGFactor:
		var cache = Util.RNG.getRandomNumber(1,int(diceSize))
		RNGsum += cache
	return RNGsum

func calculateResult(RNGsum:int, staticMod:String ,operand:String) -> int:
	match operand:
		"+":
			return RNGsum + int(staticMod)
		"-":
			return RNGsum - int(staticMod)
		"*":
			return RNGsum * int(staticMod)
		"/":
			return RNGsum / int(staticMod)
	return -9999


###########
##  PRC  ##
###########
func runPercent(value):
	pass

###########
##  TMS  ##
###########
func runTimes(value):
	pass










