
# CLASS The actual Usable Skill of Players, only BaseKitPartEntity is mandatory         
# CLASS API_004_KitSet.mergeKitParts(Array) merges their stats into this Entity         
# CLASS not all stats of Kitparts gets merged, only accumulated meta-values,see beneath 
# CLASS                                                                                 
# CLASS After Merge, the single kitparts are still neccessary for run() on a Target     
# CLASS                                                                                 
# DOCS  https://mizzitgamestudios.github.io/mkDocs/site/Entities/kitset/                
# CLASS                                                                                 
# BOOKMARK[epic=Entities_Core] Kitset                                              
extends Entity 
class_name KitSetEntity



# REFACTOR  replace with specific kitpartEntities  
var base     : KitPartEntity
var mod      : KitPartEntity
var appendix : KitPartEntity


var toString            : String 	# VAR name of Kitset shown to player                  

var cooldownTime        : int		# VAR number of rounds in action untill its reusable  
var currentCooldownTime : int		# VAR dynamic cooldownTime                            

var mType               : String	# VAR ENUM.M_TYPE.X                                   
var reach               : int       # VAR number of Tiles it can effect         

var effect: EffectEntity
var initialSelect       = []        # VAR Quickreference for the Player-select on Tilemap 



# ----- FUNCTIONS ------------------------------------------------------------ ##
# REFACTOR not used/called 
# FUNC gets triggered on the validated Entities after select 
func run():
	base.effect.activate()
	if hasMod():      mod.effect.activate()
	if hasAppendix(): appendix.effect.activate()


# FUNC shows the Cooldwontimer on the GUI 
func currentCooldownTimeToRTL():
	if currentCooldownTime == cooldownTime: return "[color=green]READY[/color]"
	else:                                   return "[color=yellow]"+str(cooldownTime-currentCooldownTime)+"[/color]"



# ----- HELPERS -------------------------------------------------------------- ##


func hasMod():      return mod      != null
func hasAppendix(): return appendix != null

# REFACTOR  Redundand       

# VAR KitPart: [BASE]  | [MOD]   | [APPENDIX]     |                                                            
# VAR Unit:    [SPAWN] | [ONSET] | [HIT]          | [OFFSET]                                                   
# VAR Slot:    [TIME]  | [SPACE] | [TRIGGER_BASE] | [TRIGGER_SPECIFIC] | [EFFECT_CONDITION] | [EFFECT_STATMOD] 
func getSlot(kitPart:String,unit:int,slot:String): return API_004_KitSet.getSlot(self,kitPart,unit,slot)


# VAR Unit:    [SPAWN] | [ONSET] | [HIT]          | [OFFSET]                                                   
# VAR Slot:    [TIME]  | [SPACE] | [TRIGGER_BASE] | [TRIGGER_SPECIFIC] | [EFFECT_CONDITION] | [EFFECT_STATMOD] 
func getBaseSlot(unit:int,slot:String): return API_004_KitSet.getSlot(self,str(self.base),unit,slot)


		



