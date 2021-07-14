extends Node2D





func initialice(kitCategoryEnum:int,kitPartEnum:int):
	var listOfKits = getKitCategoryByEnum(kitCategoryEnum)
	var kitventory:Array = API_006_Player.currentChar.kitventory.kitventory.listOfKits.values()

	var kitsToLoad = []
	match kitPartEnum:
		ENUM.KITS.PARTS.BASE      : kitsToLoad = loadBaseKit(kitventory,ENUM.KITS.PARTS.BASE)
		ENUM.KITS.PARTS.MOD       : kitsToLoad = loadBaseKit(kitventory,ENUM.KITS.PARTS.MOD)
		ENUM.KITS.PARTS.APPENDIX  : kitsToLoad = loadBaseKit(kitventory,ENUM.KITS.PARTS.APPENDIX)
	
	for i in kitsToLoad.size():
		print(kitsToLoad[i].name())
		get_node("VBoxContainer/"+str(i)+"/Name/RichTextLabel").bbcode_text = kitsToLoad[i].name()







func getKitCategoryByEnum(kitCategoryEnum):
	var dictOfKits   = API_001_Atlas.KitParts().allBasekitGroups
	var KIT_CATEGORY = ENUM.KITS.CATEGORY.values()

	for currentCategory in KIT_CATEGORY:   
		if currentCategory == kitCategoryEnum:  
			return API_001_Atlas.getKitGroup(currentCategory) 

 

func loadBaseKit(kitventory:Array,kitPartEnum:int):
	var arrToReturn = []
	for kitPart in kitventory:
		if kitPart.partType() == kitPartEnum:
			arrToReturn.append(kitPart)
	
	return arrToReturn
