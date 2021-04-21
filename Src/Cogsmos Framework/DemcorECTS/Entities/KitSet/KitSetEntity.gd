extends Entity
class_name KitSetEntity


#//CLASS set of kitparts to determine the merge specific vars 
# TODO  replace with specific kitpartEntities
var base     : KitPartEntity
var mod      : KitPartEntity
var appendix : KitPartEntity


var toString            : String 	#VAR name of Kitset shown to player 

var cooldownTime        : int
var currentCooldownTime : int

var mType               : String
var reach               : int

var listOfEffects       : Array
var initialSelect       = []

var effect:EffectEntity 



func run():
	base.effect.activate()
	if hasMod():      mod.effect.activate()
	if hasAppendix(): appendix.effect.activate()


func hasMod():      return mod      != null
func hasAppendix(): return appendix != null


func currentCooldownTimeToRTL():
	if currentCooldownTime == cooldownTime: return "[color=green]READY[/color]"
	else:                                   return "[color=yellow]"+str(cooldownTime-currentCooldownTime)+"[/color]"


#VAR KitPart: [BASE]  | [MOD]   | [APPENDIX]     |                                                            
#VAR Unit:    [SPAWN] | [ONSET] | [HIT]          | [OFFSET]                                                   
#VAR Slot:    [TIME]  | [SPACE] | [TRIGGER_BASE] | [TRIGGER_SPECIFIC] | [EFFECT_CONDITION] | [EFFECT_STATMOD] 
func getSlot(kitPart:String,unit:int,slot:String): return API_005_KitSet.getSlot(self,kitPart,unit,slot)


#VAR Unit:    [SPAWN] | [ONSET] | [HIT]          | [OFFSET]                                                   
#VAR Slot:    [TIME]  | [SPACE] | [TRIGGER_BASE] | [TRIGGER_SPECIFIC] | [EFFECT_CONDITION] | [EFFECT_STATMOD] 
func getBaseSlot(unit:int,slot:String): return API_005_KitSet.getSlot(self,str(self.base),unit,slot)





