extends Control



onready var timeManager     = self.get_node("Time")
onready var effectManager   = self.get_node("Effect")
onready var spaceManager    = self.get_node("Space")
onready var triggerManager  = self.get_node("Trigger")


var cachedKitsetEffect
func fillForm(kitPart):
	
	cachedKitsetEffect = kitPart
	
	timeManager.manageTime(kitPart)
	
	for slot in timeManager.getSlots(kitPart):
		if slot is Effect_Unit_Component:
			loadSlotIntoForm(slot)



func loadSlotIntoForm(slot):
		spaceManager.manageSpace(slot)
		triggerManager.manageTrigger(slot)
		effectManager.manageEffect(slot)



func _on_ONSET_pressed() -> void:   	loadSlotIntoForm(cachedKitsetEffect.onsetComponent)
func _on_SPAWN_pressed() -> void:   loadSlotIntoForm(cachedKitsetEffect.spawnComponent)
func _on_HIT_pressed() -> void:     loadSlotIntoForm(cachedKitsetEffect.hitComponent)
func _on_OFFSET_pressed() -> void:  loadSlotIntoForm(cachedKitsetEffect.offsetComponent)
