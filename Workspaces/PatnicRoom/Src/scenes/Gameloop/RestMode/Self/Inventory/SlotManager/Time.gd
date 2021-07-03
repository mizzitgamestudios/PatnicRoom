extends Control

onready var timeList    = self.get_node("list")
onready var timeOne     = self.get_node("Effect/Time/Reach/ContentPanel/RichTextLabel2")
onready var timeTwo     = self.get_node("Effect/Time/Reach/ContentPanel2/RichTextLabel2")
onready var timeThree   = self.get_node("Effect/Time/Reach/ContentPanel3/RichTextLabel2")
onready var timeFour    = self.get_node("Effect/Time/Reach/ContentPanel4/RichTextLabel2")
onready var arrOfTime   = [timeOne,timeTwo,timeThree,timeFour] 


func manageTime(kitset):
	var arrOfSlots = getSlots(kitset)
	insertTime(arrOfSlots)




func insertTime(arrOfSlots):
	for i in timeList.get_children().size():
		
		var currentTime = arrOfSlots[3-i]
		var entry       = timeList.get_node(str(i)).get_node("nr")
		var descriptor   = timeList.get_node(str(i)).get_node("RichTextLabel3")
		
		
		if currentTime is String:
			if currentTime.to_lower() == "void": 
				entry.bbcode_text      = "VOID"
				entry.get_parent().visible = false
				descriptor.bbcode_text = ""
		
		
		
		if currentTime is Effect_Unit_Component:
			var test =timeList.get_node(str(i))
			var but = test.get_node("Button")
			but.visible = true
			var value = currentTime.time.value
			
			if str(value) == "0" or str(value).to_lower() == "instant":
				entry.bbcode_text      = "[color=yellow]INSTANT"
				descriptor.bbcode_text = ""
			
			if str(value) == "1":
				entry.bbcode_text      = "1"
				descriptor.bbcode_text = "Turn"
		
			if int(value) > 1 :
				entry.bbcode_text      = str(value)
				descriptor.bbcode_text = "Turns"




func getSlots(kitsetEffect):
	var arrToReturn = []
	var arrOfSlots = [kitsetEffect.offsetComponent,kitsetEffect.hitComponent,kitsetEffect.onsetComponent,kitsetEffect.spawnComponent]
	
	for entry in arrOfSlots:
		if is_instance_valid(entry):  arrToReturn.append(entry)
		else: arrToReturn.append("Void")
	
	return arrToReturn
