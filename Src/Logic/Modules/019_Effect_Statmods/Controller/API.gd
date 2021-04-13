extends DemocrECTS_Controller


#----- INITIALICER ---------------------------------------------------------------##

var _statmodindex: _19_Unique_Statmod_Index


func _init() -> void:
	self.name       = "API_019_EffectStatmods"
	_statmodindex = _19_Unique_Statmod_Index.new()

func manageUniqueStatmod(selectedPos, statmodName:String, modValue):
	var nameOfUniqueStatmods  = _statmodindex.EFFECT_UNIQUE_STATMOD.keys()
	var classOfUniqueStatmods = _statmodindex.EFFECT_UNIQUE_STATMOD.values()

	if is_instance_valid(selectedPos):

		for i in nameOfUniqueStatmods.size():

			var currentClass = classOfUniqueStatmods[i]
			var currentName  = nameOfUniqueStatmods[i]

			if statmodName  == currentName:
				currentClass.run(selectedPos,modValue)

func hasStatmodInIndex(toLookUp:String):
	return _statmodindex.EFFECT_UNIQUE_STATMOD.has(toLookUp)







