extends Object
class_name _Davinci_getter


# ----- ENUM.ALL_INPUTS ------------------------------------------------------ ##

static func getInputAsString(event:InputEvent) -> String:
	for entry in ENUM.ALL_INPUTS:
		if event.is_action(entry):   return entry
		
	return ""


static func getInputAsEnum(event:InputEvent) -> int:
	return ENUM.ALL_INPUTS.find( getInputAsString(event) )



# ----- ENUM.INPUT_TYPE ------------------------------------------------------ ##

static func getInputTypeOfEnum(event:InputEvent) -> int:
	var inputEnum = getInputAsEnum(event)
	return getInputTypeByEnum(inputEnum)
	

static func getInputTypeByEnum(inputEnum):
	if   ENUM.INPUTS.INTERFACE.values().has(inputEnum) : return ENUM.INPUT_MODE.INTERFACE
	elif ENUM.INPUTS.ACTION.values().has(inputEnum)    : return ENUM.INPUT_MODE.ACTION
	elif ENUM.INPUTS.INFO.values().has(inputEnum)      : return ENUM.INPUT_MODE.INFO
	elif ENUM.INPUTS.MOVEMENT.values().has(inputEnum)  : return ENUM.INPUT_MODE.MOVEMENT
	
	else:                                       return ENUM.INPUT_MODE.VOID







