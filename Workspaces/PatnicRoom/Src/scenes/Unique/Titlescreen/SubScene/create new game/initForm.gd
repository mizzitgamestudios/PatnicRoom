extends Node

var checkboxManager = CheckboxConstructor.new()


func setTextfield(base):
	base.allTextFieldPanels.append(get_node("Seed/nameZone3/nameInput"))
	base.allTextFieldPanels.append(get_node("form_starting kit2/already known/nameZone2/nameInput"))
	base.allTextFieldPanels.append(get_node("One Name/nameZone/nameInput"))


var type
func setPerk(base):
	var listOfPerksCheckboxes=[]
	var xOne=1423
	var xTwo=1623
	var ybase=703
	var panelName = "perk"
	listOfPerksCheckboxes.append([xOne,ybase,"go big or go home",  panelName, get_parent()])
	listOfPerksCheckboxes.append([xTwo,ybase,"sell out",           "perk",get_parent()])
	listOfPerksCheckboxes.append([xOne,ybase+63,"ganger",          "perk",get_parent()])
	listOfPerksCheckboxes.append([xTwo,ybase+63,"most wante",      "perk",get_parent()])
	listOfPerksCheckboxes.append([xOne,ybase+126,"wanderer",       "perk",get_parent()])
	listOfPerksCheckboxes.append([xTwo,ybase+126,"blub",           "perk",get_parent()])
	listOfPerksCheckboxes.append([xOne,ybase+189,"blub",           "perk",get_parent()])
	listOfPerksCheckboxes.append([xTwo,ybase+189,"blub",           "perk",get_parent()])
	
	for i in listOfPerksCheckboxes.size():
		var cache = checkboxManager.compactConstruct(listOfPerksCheckboxes[i])
		get_parent().addInputfieldToFormgroup(cache,listOfPerksCheckboxes[i][3])


func setRace(base):
	var listOfPerksCheckboxes=[]
	var xOne=1170
	var yOne=675
	listOfPerksCheckboxes.append([xOne,yOne,"human",        "race",get_parent()])
	listOfPerksCheckboxes.append([xOne,yOne+60,"dwarf",    "race",get_parent()])
	listOfPerksCheckboxes.append([xOne,yOne+120,"troll",    "race",get_parent()])
	listOfPerksCheckboxes.append([xOne,yOne+180,"elf",      "race",get_parent()])
	
	for i in listOfPerksCheckboxes.size():
		var cache = checkboxManager.compactConstruct(listOfPerksCheckboxes[i])
		get_parent().addInputfieldToFormgroup(cache,listOfPerksCheckboxes[i][3])

var listOfPerksCheckboxes=[]
func setKit(base):
	
	var xOne=770
	var xTwo=910
	var xThree=1010
	
	var yOne=625
	var yTwo=782
	var yThree=705
	
	listOfPerksCheckboxes.append([xOne,yOne,"meele",        "kit",get_parent()])
	listOfPerksCheckboxes.append([xOne,yTwo,"cyberware",       "kit",get_parent()])
	listOfPerksCheckboxes.append([xOne,yThree,"infusion",      "kit",get_parent()])
	
	listOfPerksCheckboxes.append([xTwo,yTwo,"hack",      "kit",get_parent()])
	listOfPerksCheckboxes.append([xTwo,yOne,"gun",     "kit",get_parent()])
	listOfPerksCheckboxes.append([xTwo,yThree,"spell",    "kit",get_parent()])

	#listOfPerksCheckboxes.append([xThree,yOne,"armor",       "kit",get_parent()])
	#listOfPerksCheckboxes.append([xThree,yTwo,"drone",      "kit",get_parent()])
	#listOfPerksCheckboxes.append([xThree,yThree,"rite",     "kit",get_parent()])

	
	for i in listOfPerksCheckboxes.size():
		var cache = checkboxManager.compactConstruct(listOfPerksCheckboxes[i])
		get_parent().addInputfieldToFormgroup(cache,listOfPerksCheckboxes[i][3])
	


func setAttribute(base):
	var listOfPerksCheckboxes=[]
	var xOne=344
	var xTwo=910
	var xThree=1010
	
	var yOne=584
	var yTwo=782
	var yThree=705
	
	listOfPerksCheckboxes.append([344,53,"logik","attribute",get_parent()])

	
	for i in listOfPerksCheckboxes.size():
		var cache = checkboxManager.compactConstruct(listOfPerksCheckboxes[i])
		get_parent().addInputfieldToFormgroup(cache,listOfPerksCheckboxes[i][3])


func getCheckboxByContent(content:String):
	for i in listOfPerksCheckboxes.size():
		var currentCheckbox = listOfPerksCheckboxes[i]
		var currentContent = currentCheckbox[2]
		
		if currentContent == content:
			get_node("..").manageCheckboxes(currentCheckbox)
		
