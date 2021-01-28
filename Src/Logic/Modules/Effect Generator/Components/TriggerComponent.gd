extends Component
class_name TriggerComponent

var strategy: String
var reach

func initialize(strategyPara: String):
	strategy = strategyPara

static func hasProjectileHit(reach, posOfTarget: Vector2):
	return SpaceComponent.moveByLinear(reach, posOfTarget)
