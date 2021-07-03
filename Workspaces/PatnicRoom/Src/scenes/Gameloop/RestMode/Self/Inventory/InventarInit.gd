extends Node2D


func _ready():
<<<<<<< HEAD
	Gameloop.scene = self
	get_node("background").texture = Util.RNG.getRngBackground()



=======
	get_node("background").texture = RestMode.background



func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if Util.Nodes.isMouseOnNode(get_node("root_Kits/list")):
			getSpecificCLickedNode()


>>>>>>> 14ed4bc523602584d0fecdfce3fc61f9ee8a2684
var player = API_006_Player.currentChar
func getSpecificCLickedNode():
	for i in 10:
		var currentNode = get_node("root_Kits/list").get_node(str(i+1))
		if Util.Nodes.isMouseOnNode(currentNode):
			var kitPartString
			
			
			if Util.Nodes.isMouseOnNode(currentNode.get_node("Base")):
				kitPartString = currentNode.get_node("Base").get_node("text").bbcode_text
				
			elif Util.Nodes.isMouseOnNode(currentNode.get_node("Mod")):
				kitPartString = currentNode.get_node("Mod").get_node("text").bbcode_text
			
			elif Util.Nodes.isMouseOnNode(currentNode.get_node("Appendix")):
				kitPartString = currentNode.get_node("Appendix").get_node("text").bbcode_text
			

			setStatsFor(player.kitset().getKitSetByLevel(0).base)
		
	


func setStatsFor(kitPart:KitPartEntity):
	get_node("root_Kits2/selected kit").bbcode_text = kitPart.toString()
	get_node("root_Kits2/whole Panel/Generall/description value Panel/text").bbcode_text = str(kitPart.decription())
	get_node("root_Kits2/whole Panel/Meta/Rarity value Panel/text").bbcode_text = "[center]"+str(kitPart.rarity())
	get_node("root_Kits2/whole Panel/Meta/cooldown value Panel/text").bbcode_text = "[center]"+str(kitPart.cooldownTime())
<<<<<<< HEAD



func fillKitInfo(kitset):
	for part in ["BASE","MOD","APPENDIX"]: get_node("Kit Info/"+part).visible = false
	
	
	get_node("Kit Info/Generall").manageGenerall(kitset)
	
	
	var cache
	if   kitset.hasFlag("F_15_KITPART_TYPE_BASE"):       cache = fillByFlag(kitset , "C_49_EFFECT_REFERENCE" , "BASE"     )
	elif kitset.hasFlag("F_16_KITPART_TYPE_MOD"):        cache = fillByFlag(kitset , "C_59_KIT_MOD_CHANGE"   , "MOD"      )
	elif kitset.hasFlag("F_17_KITPART_TYPE_APPENDIX"):   cache = fillByFlag(kitset , ""                      , "APPENDIX" )
	
	
	cache["TO_SHOW"].visible = true
	cache["TO_SHOW"].fillForm(cache["TO_PARSE"])



func fillByFlag(kitset,comp,type):
	return { 
		"TO_PARSE" : kitset.getCompValue(comp),
		"TO_SHOW"  : get_node("Kit Info/"+type)
		}
=======
	


>>>>>>> 14ed4bc523602584d0fecdfce3fc61f9ee8a2684
