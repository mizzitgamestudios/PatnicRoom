extends KitPartEntity
class_name ModKitPartEntity


func _init(ent) -> void:
	self.dictOfComps     = ent.dictOfComps.duplicate(true)
	self.arrOfFlags      = ent.arrOfFlags.duplicate(false)
	self.dictOfTemplates = ent.dictOfTemplates.duplicate(false)
	ent.free()







