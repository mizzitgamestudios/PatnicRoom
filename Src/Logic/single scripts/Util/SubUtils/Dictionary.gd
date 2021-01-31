###############################################################################################################################
#                                                                                                                             #
# Klasse:		Dictionary Util                                                                                               #
# description:	converts and autofills DIctionary                                                                             #
#                                                                                                                             #
# data flow:	SokraTiles -> PanicMode -> Actor Layor                                                                        #
#                                                                                                                             #
# often called:	@use() with parameter                                                                                         #
#                                     "zeroOut" to init with values of 0                                                      #
#                                     "increment" to add a Key to its previous value                                          #
#                                     "replace" to replace a key with something                                               #
#                                                                                                                             #
###############################################################################################################################

extends Node
class_name DictionaryUtil


########################
# --- Main ----------- #
########################
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



########################
# --- Subfunctions ----------- #
########################
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
