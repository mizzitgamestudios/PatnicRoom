extends Component
class_name Effect_Generator_API



var simpleGenerator = Effect_Generator_Simpel.new()

func getProcessOfEffect(properties:Dictionary):
	return simpleGenerator.buildEffectProcess(properties)


