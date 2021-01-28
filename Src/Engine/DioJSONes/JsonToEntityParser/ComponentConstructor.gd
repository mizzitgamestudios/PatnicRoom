extends Component
class_name DioJSONes_SubParser_ComponentConstructor

var value
var key : String

func _init(keyPara: String, valuePara):
	self.value = valuePara
	self.key = keyPara

func run():
	var component = DemokrECTS.componentIndex.index[key].new(value)
	if is_instance_valid(component):
		return component
	return null
