extends DemocrECTS_Controller


var _005_runEffect

func _ready() -> void:
	_005_runEffect = _05_runEffect.new()



func runKitSet(kitsSet:KitSetEntity,direction):
	if kitsSet.mod != null:
		_005_runEffect.runEffect(kitsSet.mod.effect,direction)
	else:
		_005_runEffect.runEffect(kitsSet.base.effect,direction)

