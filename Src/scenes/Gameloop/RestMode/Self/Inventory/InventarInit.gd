extends Node2D


func _ready():
	get_node("background").texture = RestMode.background



func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if Util.Nodes.isMouseOnNode(get_node("root_Kits/list")):
			getSpecificCLickedNode()


var player = API_011_Player.currentChar
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
			

			setStatsFor(player.kitsSets.getKit(kitPartString).base)
		
	


func setStatsFor(kitPart:KitPartEntity):
	get_node("root_Kits2/selected kit").bbcode_text = kitPart.toString.value
	get_node("root_Kits2/whole Panel/Generall/description value Panel/text").bbcode_text = kitPart.decription.value
	get_node("root_Kits2/whole Panel/Meta/Rarity value Panel/text").bbcode_text = "[center]"+kitPart.rarity.value
	get_node("root_Kits2/whole Panel/Meta/cooldown value Panel/text").bbcode_text = "[center]"+kitPart.cooldownTime.value
	


