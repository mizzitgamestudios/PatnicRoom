extends Object
class_name KitSetEntity

var base: BaseKitPartEntity
var mod: ModKitPartEntity
var appendix: AppendixKitPartEntity

var baseToString: String = ""
var modToString: String = ""
var appendixToString: String = ""


func _init(listOfKitparts:Array) -> void:
	if listOfKitparts[0] != null:
		self.base = listOfKitparts[0]
		baseToString = str(base.toString.value)
	
	if listOfKitparts[1] != null:
		self.mod = listOfKitparts[1]
		modToString = str(mod.toString.value)
	
	if listOfKitparts[2] != null:
		self.appendix = listOfKitparts[2]
		appendixToString = str(appendix.toString.value)


func toString():
	if appendix == null and mod != null:
		return modToString+" "+baseToString
	
	if appendix != null and mod == null:
		return baseToString+" of "+appendixToString
	
	if appendix == null and mod == null:
		return baseToString
	
	else:
		return modToString+" "+baseToString+" of "+appendixToString



func printSomething(toPrint:String="test"):
	print(toPrint)


func hasMod():
	if mod == null:
		return false
	else:
		return true


func hasAppendix():
	if appendix == null:
		return false
	else:
		return true



