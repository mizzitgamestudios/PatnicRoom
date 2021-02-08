extends Node
class_name FilepathBuilder


func getPathToModules():
	return "res://Src/Logic/Modules"

func getModule_00_00():
	return getPathToModules()+"/00_01 Basic Tiles Components"
func getModule_00_01():
	return getPathToModules()+"/00_01 Metahuman Stats"

func getModule_01_00():
	return getPathToModules()+"/01_00 Effect Generator"
func getModule_01_01():
	return getPathToModules()+"/003_Conditions"

func getModule_02_00():
	return getPathToModules()+"/02_00 Items"
func getModule_02_01():
	return getPathToModules()+"/02_01 KitSet"
func getModule_02_02():
	return getPathToModules()+"/02_02 Kitparts"

func getModule_03_00():
	return getPathToModules()+"/03_00 Procgen Actor"
func getModule_03_01():
	return getPathToModules()+"/03_01 Procgen Chunk"

 
func getConditions():
	return getModule_01_01()+"/Components"
