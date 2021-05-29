extends Node
class_name StationManager




func manageKitStation(node):
	manageKitBase(RestMode.station,node)
	
	
func manageKitBase(category,node):
	match category:
		"Workshop":
			RestMode.kitSelection.fillCategoryNodes(RestMode.kitSelection.kitFilePaths["meat"],node)
		"Terminal":
			RestMode.kitSelection.fillCategoryNodes(RestMode.kitSelection.kitFilePaths["matrix"],node)
		"Retreat":
			RestMode.kitSelection.fillCategoryNodes(RestMode.kitSelection.kitFilePaths["magic"],node)


