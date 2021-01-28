extends Entity
class_name KitPartEntity

################################################################################
##  --- Variables ---                                                         ##
################################################################################

var cooldown:Component
var conditions:Component
var description:Component

var mType:Component
var kitCat:Component

var nameOfKit:Component
var description:Component
var setName:Component

var dictForDeepCopy= {}

################################################################################
##  --- Functions ---                                                         ##
################################################################################
func deepCopy():
	if !dictForDeepCopy.has("Comp_Kit_SetName"):
		buildDictForDeepCopy()

	return #DemokrECTS.tileEntManager.constructEnt(dictForDeepCopy)


func buildDictForDeepCopy():
	dictForDeepCopy["Comp_Kit_BaseConnection"] = baseConnection()
	dictForDeepCopy["Comp_Kit_ModConnection"] = modConnection()
	dictForDeepCopy["Comp_Kit_AppendixConnection"] = appendixConnection()

	dictForDeepCopy["Comp_Kit_MType"] = mType()
	dictForDeepCopy["Comp_Kit_KitCat"] = kitCat()

	dictForDeepCopy["Comp_Kit_Description"] = description()
	dictForDeepCopy["Comp_Kit_SetName"]= setName()



################################################################################
##  --- Signals ---                                                           ##
################################################################################




################################################################################
##  --- Getter ---                                                            ##
################################################################################

func baseConnection() -> Entity:
	return baseConnection.value

func modConnection() -> Entity:
	return modConnection.value

func appendixConnection() -> Entity:
	return appendixConnection.value

func mType() -> String:
	return mType.value

func kitCat() -> String:
	return kitCat.value

func description() -> String:
	return description.value

func setName() -> String:
	var baseToString = baseConnection().toString()
	var modToString = modConnection().toString()
	var appendixToString = appendixConnection().toString()
	return modToString + " " + baseToString + " of " + appendixToString
