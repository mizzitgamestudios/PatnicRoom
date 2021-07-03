extends Control

onready var description  = self.get_node("Description/contentPanel/RichTextLabel")
onready var summary      = self.get_node("Summary/ContentPanel/RichTextLabel")
onready var rarity       = self.get_node("Rarity/ContentPanel/RichTextLabel")
onready var cooldown     = self.get_node("Cooldown/ContentPanel/RichTextLabel")



func manageGenerall(kitset):
	description.bbcode_text = kitset.decription()
	summary.bbcode_text     = kitset.mechanicalSummary()
	rarity.bbcode_text      = ENUM.ITEMS.RARITY_TO_STRING[kitset.rarity()]
	cooldown.bbcode_text    = str(kitset.cooldownTime())
