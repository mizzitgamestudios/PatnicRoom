extends Node

################################################################################
##  --- Parts of Engine ---                                                   ##
################################################################################

var generatorHubActors: GeneratorHubActors = GeneratorHubActors.new();
var createNPCProcess:CreateNPCProcess =CreateNPCProcess.new()



################################################################################
##  --- Custom Generation ---                                                 ##
################################################################################

func generateActorsInTools():
	generatorHubActors.generateByJSONinTools()




################################################################################
##  --- Random Generation ---                                                 ##
################################################################################

func RNGenerateActors():
	pass
func RNGenerateChunk():
	pass

