extends Object
class_name U_DEAL_PLAIN_DAMAGE



static func run(selectedPos, modValue:String):

	if selectedPos is ActorEntity: selectedPos.changeHitpoints(modValue)


		
