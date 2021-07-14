extends Control

onready var basicTrigger        = self.get_node("Basic/ContentPanel/RichTextLabel2")

onready var specificInitial     = self.get_node("Specific/Initial")
onready var specificFollowUp    = self.get_node("Specific/followUp")


var maxAmountOfSpecificTrigger = 4
var specificNodeNames          = ["connector","keyword","value"]

var cachedConnector = {}
var cachedKeyword   = {}
var cachedValue     = {}

var base
var specific

func _ready() -> void: resetForm()



func manageTrigger(unitPara):
	resetForm()
	cacheData(unitPara)
	 
	fillTriggerBasic()
	
	fillInitialSpecific()
	fillFollowUpSpecific()



func fillTriggerBasic(): 
	basicTrigger.bbcode_text = "[center][color=yellow]"+base.value


func fillInitialSpecific():
	specificInitial.get_node("value").visible = true
	specificInitial.get_node("keyword").visible = true
	var cache
	
	cache = cachedKeyword.pop_front()
	specificInitial.get_node("keyword/RichTextLabel2").bbcode_text = cache
	
	cache = cachedValue.pop_front()
	specificInitial.get_node("value/RichTextLabel2").bbcode_text   = cache
	
	if cache == "N/A":
		specificInitial.get_node("value").visible = false
		specificInitial.get_node("keyword").visible = false





func fillFollowUpSpecific():
	for i in cachedKeyword.size():
		var currentRow = getRowNodeByNr(i)
		
		currentRow.visible = true
		
		for part in specificNodeNames:
			var currentPart = getRowCollumByName(currentRow,part)
			var currentCache = getCacheByCorrespondingPart(part)
			
			currentPart.bbcode_text = currentCache[i]



func cacheData(unitPara):
	base            = unitPara.triggerBase
	specific        = unitPara.triggerSpecific
	
	
	for currentEntry in specific.specificTriggers:
		if isConnector(currentEntry):   cachedConnector.append(currentEntry)
		
		else:
			var doc = currentEntry.getDoc()
			cachedKeyword.append(doc["name"])
			cachedValue.append(currentEntry.getValueToString_quack())




func isConnector(value): return value is String and str(value) == "AND" or str(value) == "OR" 
func isKeyword(value):   return value is String and SYNTAX.EFFECT.HAS_TRIGGER_SPECIFIC(value)


func getRowNodeByNr(i):                return specificFollowUp.get_node("row"+str(i))
func getRowCollumByName(rowNode,part): return rowNode.get_node(part).get_node("RTL")

func getCacheByCorrespondingPart(part):
	match part:
		"value": return cachedValue
		"keyword": return cachedKeyword
		"connector": return cachedConnector


func resetForm():
	for child in specificFollowUp.get_children(): 
		child.visible = false
	
	cachedConnector = []
	cachedKeyword   = []
	cachedValue     = []
	base            = null
	specific        = null

