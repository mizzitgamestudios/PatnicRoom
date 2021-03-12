extends Component
class_name DioJSONes_SubParser_ComponentConstructor

var value
var key : String

func _init(keyPara: String, valuePara):
	self.value = valuePara
	self.key = keyPara

func run():
	var component = COMP.ATLAS_INDEX_COMP[key]
	var compInst = component.new(value)
	if is_instance_valid(compInst):
		return compInst
	return null
