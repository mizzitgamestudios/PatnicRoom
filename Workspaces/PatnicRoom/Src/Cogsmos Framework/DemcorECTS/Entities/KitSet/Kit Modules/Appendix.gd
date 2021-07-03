
# CLASS                                                                              
# DOCS 	                                                                             
# CLASS                                                                              
# BOOKMARK[epic=Entities_Kitpart] Appendix                                           
extends KitPartEntity
class_name AppendixKitPartEntity 

func _init(ent) -> void:
	self.dictOfComps     = ent.dictOfComps.duplicate(true)
	self.arrOfFlags      = ent.arrOfFlags.duplicate(false)
	self.dictOfTemplates = ent.dictOfTemplates.duplicate(false)
	ent.free()




