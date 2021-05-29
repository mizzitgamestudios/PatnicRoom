extends Viewport
class_name MouseMarker




static func getMouseMarker(ent):
	match ent.typeToString():
		ENUM.TYPES_ON_MAP.TILE        :  return _getActionType(ENUM.MOUSE_INPUT_MODE.ONLOOK, ent)
		ENUM.TYPES_ON_MAP.INTERACT    :  return _getActionType(ENUM.MOUSE_INPUT_MODE.ONLOOK, ent)
		ENUM.TYPES_ON_MAP.ACTOR       :  return _getActionType(ENUM.MOUSE_INPUT_MODE.ONLOOK, ent)
		ENUM.TYPES_ON_MAP.LOOT_SOURCE :  return _getActionType(ENUM.MOUSE_INPUT_MODE.LOOT,   ent)


static func _getActionType(mode,ent):
	match mode:
		ENUM.MOUSE_INPUT_MODE.ONLOOK:   return _getOnlookMarker(ent)
		ENUM.MOUSE_INPUT_MODE.LOOT:     return _getLootMarker(ent)





static func _getOnlookMarker(ent):
	var entityType = ent.typeToString()

	match entityType:
		ENUM.TYPES_ON_MAP.TILE     : return "Marker_0_7"
		ENUM.TYPES_ON_MAP.INTERACT : return "Marker_0_6"
		ENUM.TYPES_ON_MAP.ACTOR    : return "Marker_0_8"
 
		

static func _getLootMarker(availabillity):
	match availabillity:
		"EMPTY"    : return "Marker_1_6"
		"OPEN"     : return "Marker_1_7"
		"CLOSED"   : return "Marker_1_8"
