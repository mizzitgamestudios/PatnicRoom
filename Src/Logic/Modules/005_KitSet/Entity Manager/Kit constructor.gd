extends Component
class_name KitSetConstructor


var arrOfKitParts = [BaseKitPartEntity,ModKitPartEntity,AppendixKitPartEntity]
func constructBySingleKitPart(ent):
	var arr = [null,null,null]
	
	for i in arr.size():
		if ent is arrOfKitParts[i]:
			arr[i] = ent


	var kitSet = KitSetEntity.new(arr)


func constructByArraYKitPart(array:Array):
	var arr = [null,null,null]
	
	for i in array.size():
		if array[i] != "NULL":
			var kitPartEnt = DemokrECTS.groupManager.parseThroughAllToSearch(array[i])
			arr[i] = kitPartEnt
	
	return KitSetEntity.new(arr)









