###############################################################################################################################
#                                                                                                                             #
# Klasse:		--- ArisPROCGENes ---                                                                                         #
# description:	Responsible for the generation of Game-elements,ecspecially Chunks #
#                                                                                                                             #
# data flow:	External JSON -> Tilemap(ActorLayer)                                                                          #
# often called:	N/A                                                                                                           #
#                                                                                                                             #
###############################################################################################################################

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

