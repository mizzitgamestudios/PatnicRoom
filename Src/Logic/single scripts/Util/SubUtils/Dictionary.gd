extends Node
class_name DictionaryUtil


func use(oldDict,mode,newDict):
	var returnDict = {}
	var oldKeys = oldDict.keys()
	
	if mode=="zeroOut":
		return zeroOut(oldDict,oldKeys)	
	
	
	for i in oldKeys.size():
		var commonKey=oldKeys[i]
		returnDict[commonKey] = oldDict[commonKey]
		if newDict.has(commonKey):
			returnDict[commonKey] = getMode(oldDict,newDict,commonKey,mode)
		
	return returnDict


func convertArrayToDictionary(array,defaultValue):
	var dict={}
	for i in array.size():
		dict[array[i]]=defaultValue
	return dict


func getMode(oldDict,newDict,commonKey,mode):
	match mode:
		"increment":
			return int(oldDict[commonKey]) + int(newDict[commonKey])
		"replace":
			return newDict[commonKey]


func zeroOut(oldDict,oldKeys):
	for i in oldKeys.size():
		oldDict[oldKeys[i]] = 0
	return oldDict
