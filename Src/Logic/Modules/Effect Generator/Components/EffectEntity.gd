extends Entity
class_name EffectEntity

var spawnComponent: EffectTComponent
var onsetComponent: EffectTComponent
var hitComponent: EffectTComponent
var offsetComponent: EffectTComponent



func setSpecificComp(comp:EffectTComponent, intOfT:int):
	match intOfT:
		0:
			spawnComponent = comp
		1:
			onsetComponent = comp
		2:
			hitComponent = comp
		3:
			offsetComponent = comp

