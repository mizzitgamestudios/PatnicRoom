extends Object
class_name DIOJSONES_UNIQUE_STATMOD



static func manageUniqueStatmod(selectedPos, statmodName:String, modValue):
	var nameOfUniqueStatmods  = Syntax_Effect.EFFECT_UNIQUE_STATMOD.keys()
	var classOfUniqueStatmods = Syntax_Effect.EFFECT_UNIQUE_STATMOD.values()

	if is_instance_valid(selectedPos):

		for i in nameOfUniqueStatmods.size():

			var currentClass = classOfUniqueStatmods[i]
			var currentName  = nameOfUniqueStatmods[i]

			if statmodName  == currentName:
				currentClass.run(selectedPos,modValue)






 
 
