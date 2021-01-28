extends Entity
class_name Ent_Kit_Base


func _init(tempdict:Dictionary) -> void:
	
	self.add_component( Comp_Universal_Description.new(tempdict["description"]) )
	self.add_component( Comp_Universal_Name.new(tempdict["name"]) )
	
	self.add_component( Comp_Kit_ConnectedAppendix.new(tempdict["description"]) )
	self.add_component( Comp_Kit_ConnectedBase.new(tempdict["name"]) )
	self.add_component( Comp_Kit_ConnectedMod.new(tempdict["description"]) )
	
	self.add_component( Comp_Kit_KitCat.new(tempdict["name"]) )
	self.add_component( Comp_Kit_KitType.new(tempdict["description"]) )
	
	self.add_component( Comp_Kit_LogToString.new(tempdict["name"]) )
	self.add_component( Comp_Kit_SymbiosType.new(tempdict["description"]) )
