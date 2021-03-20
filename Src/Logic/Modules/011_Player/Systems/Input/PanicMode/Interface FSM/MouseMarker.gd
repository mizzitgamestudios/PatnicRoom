extends Viewport
class_name MouseMarker




static func getMouseMarker(ent):
	match ent.typeToString():

		ENUM.DICT_TYPES_ON_MAP.TILE        :  return _getActionType("ONLOOK", ent)
		ENUM.DICT_TYPES_ON_MAP.INTERACT    :  return _getActionType("ONLOOK", ent)
		ENUM.DICT_TYPES_ON_MAP.ACTOR       :  return _getActionType("ONLOOK", ent)
		ENUM.DICT_TYPES_ON_MAP.LOOT_SOURCE :  return _getActionType("LOOT",   ent)

		

static func _getActionType(mode,ent):
	match mode:

		ENUM.MOUSE_INPUT_MODE.ONLOOK:
			return _getOnlookMarker(ent)

		ENUM.MOUSE_INPUT_MODE.LOOT:
			return _getLootMarker(ent)





static func _getOnlookMarker(ent):
	var entityType = ent.typeToString()

	match entityType:
		"TILE"    : return "Marker_0_7"
		"INTERACT": return "Marker_0_6"
		"ACTOR"   : return "Marker_0_8"

		

static func _getLootMarker(availabillity):
	match availabillity:
		"EMPTY"    : return "Marker_1_6"
		"OPEN"     : return "Marker_1_7"
		"CLOSED"   : return "Marker_1_8"
