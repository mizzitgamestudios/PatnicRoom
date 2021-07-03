extends DemocrECTS_Controller
# BOOKMARK[epic=Modules] 009_Stat_Mods                                              

# ----- INITIALICER -------------------------------------------------------------- ##

var _statmodindex: _19_Unique_Statmod_Index


func _init() -> void:
	self.name       = "API_019_EffectStatmods"
	_statmodindex = _19_Unique_Statmod_Index.new()



# ----- GETTER ------------------------------------------------------------------- ##

func manageUniqueStatmod(ent, statmodName:String, modValue):
	var nameOfUniqueStatmods  = _statmodindex.EFFECT_UNIQUE_STATMOD.keys()
	var classOfUniqueStatmods = _statmodindex.EFFECT_UNIQUE_STATMOD.values()

	if is_instance_valid(ent):
		for i in nameOfUniqueStatmods.size():

			var currentClass = classOfUniqueStatmods[i]
			var currentName  = nameOfUniqueStatmods[i]

			
			if statmodName  == currentName: currentClass.run(ent,modValue)



func hasStatmodInIndex(toLookUp:String):
	return _statmodindex.EFFECT_UNIQUE_STATMOD.has(toLookUp)







