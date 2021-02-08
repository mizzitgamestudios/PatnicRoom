extends Component
class_name SpaceComponent

var medium: String
var reach: int
var mType: int


func initialize(mediumPara: String, reachPara: int, mTypePara: int):
	medium = mediumPara
	reach = reachPara
	mType = mTypePara

static func getEnumOfMType(mtype):
	return ENUM.M_TYPE[mtype]

#static func moveByTouch(posOfEffect:Vector2):
#	return moveByLinear(1,posOfEffect)

static func moveByInstant():
	return true



#static func moveByLinear(reach:int, posOfTarget: Vector2):
#	var posBool :bool = false
#	if (posOfTarget.x + reach) - self.currentPosition.x >= 0:
#		posBool = true
#	elif (posOfTarget.y + reach) - self.currentPosition.y >= 0:
#		posBool = true
#	return posBool

static func moveByArea(posOfEffect:Vector2,radius:int):
	return true

static func moveByLinearAndArea(posOfEffect:Vector2,radius:int,reach:int):
	return true



