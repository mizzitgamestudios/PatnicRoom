extends Node
class_name Comp_Cond_CondHub


func construct(ent:Entity, condName:String, duration:int, var intensity:int=0) -> void:
	match allCoditions[condName]["type"]:
		"static":
			allCoditions[condName]["class"].new(ent,duration)
		"dynamic":
			allCoditions[condName]["class"].new(ent,duration,intensity)
	

var allCoditions={
	"Comp_Cond_Burning": Comp_Cond_Burning,                        # does damage over time,can set enflamable Tiles on Fire
	"Comp_Cond_Paralyced": Comp_Cond_Paralyced,                    # disables physical actions
	"Comp_Cond_Blind": Comp_Cond_Blind,                            # disables vision on Meatspace
	"Comp_Cond_TranscendentBody": Comp_Cond_TranscendentBody,      # lets you walk through solid Tiles
	"Comp_Cond_Duplicate": Comp_Cond_Duplicate,
	"Comp_Cond_Solidify": Comp_Cond_Solidify,
	"Comp_Cond_Confused": Comp_Cond_Confused,
}
