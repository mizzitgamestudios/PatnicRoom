extends Component
class_name EffectTComponent

var delay: int
var triggerObject: TriggerComponent
var spaceObject: SpaceComponent
var effectSlot

func initialize(delayPara:int, triggerObjectPara:TriggerComponent, spaceObjectPara:SpaceComponent,effect:Dictionary):
	delay = delayPara
	triggerObject = triggerObjectPara
	spaceObject = spaceObjectPara
	effectSlot = effect["values"]

func run():
	spaceObject.reach


