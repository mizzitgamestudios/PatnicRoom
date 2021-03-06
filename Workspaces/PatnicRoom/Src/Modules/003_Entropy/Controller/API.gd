extends DemocrECTS_Controller



# DOCS  docs/docs/Modules/003.md                                                  
# BOOKMARK[epic=Modules] 003_Entropy                                              

var entropyLevel: int = 1
var collectedEntropy: int = 0


func getCollectedEntropy():
	return collectedEntropy

func getEntropy():
	return entropyLevel

func resetEntropy():
	entropyLevel = 1

func incrementEntropy():
	entropyLevel += 1

func getEntropyToString():
	return ENUM.ENTROPY_SCALE[entropyLevel]

func getEntropyProgressColour():
	return ENUM.ENTROPY_PROGRESS_COLOR[entropyLevel]






