extends Component
class_name HeGEL_ChangeStat





func run(ent,comp,mod):
	var component = ent.getComp(comp)
	component.value = mod
