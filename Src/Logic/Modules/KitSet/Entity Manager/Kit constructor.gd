extends Component
class_name KitSetConstructor




func constructEntByDictionary(tempdict:Dictionary) -> KitSetEntity:
	var ent = KitSetEntity.new()
	ent.baseConnection = Comp_Kit_baseConnection.new(tempdict["Comp_Kit_baseConnection"])
	ent.modConnection = Comp_Kit_modConnection.new(tempdict["Comp_Kit_modConnection"])
	ent.appendixConnection = Comp_Kit_appendixConnection.new(tempdict["Comp_Kit_appendixConnection"])
	
	ent.mType = Comp_Kit_mType.new(tempdict["Comp_Kit_mType"])
	ent.kitCat = Comp_Kit_kitCat.new(tempdict["Comp_Kit_kitCat"])
	
	ent.description = Comp_Kit_description.new(tempdict["Comp_Kit_description"])
	ent.nameOfKit = Comp_Kit_nameOfKit.new(tempdict["Comp_Kit_nameOfKit"])
	
	return ent

func constructEntByEnt(arrOfEnt:Array) -> KitSetEntity:
	var ent = KitSetEntity.new()
	ent.baseConnection = arrOfEnt[0]
	ent.modConnection = arrOfEnt[1]
	ent.appendixConnection = arrOfEnt[2]
	
	ent.mType = "TODO"
	ent.kitCat = "TODO"
	
	ent.description = "TODO"
	ent.nameOfKit = "TODO"
	return ent
