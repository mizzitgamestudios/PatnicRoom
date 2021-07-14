extends Component
class_name Effect_Unit_Component



# VAR Container of all Conditions the Effect (may) cause                    
var effectCondition: Effect_Comp_EFFECT_Condition

# VAR Container of all alturations the Effect (may) cause                   
var effectStatmod: Effect_Comp_EFFECT_Statmod

# FUNC Type of Condition to trigger an effective usage                      
var triggerBase: Effect_Comp_TRIGGER_Base

# CLASS appends the rules of Conditions to trigger an effective usage     
var triggerSpecific: Effect_Comp_TRIGGER_Specific

# VAR units of Movements it takes to step into the next stage of the Effect 
var time: Effect_Comp_TIME

# CLASS describes the Shape and size of the selection on the Tilemap      
var space: Effect_Comp_SPACE




