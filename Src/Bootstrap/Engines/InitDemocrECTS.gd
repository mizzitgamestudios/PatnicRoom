extends Node
class_name InitDemocrECTS

func _init():
	DemokrECTS.groupManager = GroupManager.new()
	#DemokrECTS.component_Index = DemocrECTS_ComponentIndex.new()
	
	DemokrECTS.synch_Component_Index(_00_00_CompIndex.getIndex())
	DemokrECTS.synch_Component_Index(_00_01_CompIndex.getIndex())

	DemokrECTS.synch_Component_Index(_01_01_CompIndex.getIndex())

	DemokrECTS.synch_Component_Index(_02_00_CompIndex.getIndex())
	DemokrECTS.synch_Component_Index(_006_CompiIndex.getIndex())

	DemokrECTS.synch_Component_Index(_03_00_CompIndex.getIndex())

