## Phases
  
#### **1. SPAWN**
determinds the events between player presses enter and its effect is shown on map 

#### **2. ONSET**
determinds the events between the travel of effect to its target and their hit 

#### **3. EFFECT**
determinds the events between the actual hit and the end of its main effects

#### **3. OFFSET**
determinds the events between the last main effect and its disapearing of the Map


## Time Slot

> [!IMPORTANT]
> All of the following entries are mandatory, the following slots can be left not written if their corresponding timeslot has the value:  
 ``"N/A"``

| KeyName | possible Inputs                        | Comment       |
|---------|----------------------------------------|---------------|
| TIME-0  | number as String for rounds of actions | SPAWN  -phase |
| TIME-1  | number as String for rounds of actions | ONSET  -phase |
| TIME-2  | number as String for rounds of actions | EFFECT -phase |
| TIME-3  | number as String for rounds of actions | OFFSET -phase |

  


## Trigger Slot

> [!NOTE]
> each timeslot needs its own JSON-Object with the key ``"TRIGGER-X"`` with X for the number of the timeslot seen above

| KeyName       | possible Inputs                                                                                              | Comment                                                                                      |
|---------------|--------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------|
| BASE          | ``"TILE"``,``"ACTOR"``,``"INTERACT"``,``"INTERACT_ACTOR"``,``"TILE_ACTOR"``,``"TILE_ACTOR"``,``"ACTOR"``     | describes which type of entities will be selected of the Effect, underscore means both types |
| SPECIFIC      |                                                                                                              | narrows down select of the the BASE-type by validating following possibillities:             |
| BASE          | uses the standard select from base                                                                           |                                                                                              |
| HAS_CONDITION | String of name of Condition-Class                                                                            |                                                                                              |
| HAS_STAT      | Array of three with name of ComponentClass,operator and value to validate ``["C_1_IS_WALKABLE","=","true"]`` |                                                                                              |
| HAS_TEXTURE   | String of Component **C_2_ANY_TEXTURE_ID**                                                                   |                                                                                              |
| CHANCE        | number from 0 up to 100 for its possibillity to trigger                                                      |                                                                                              |




## Space Slot


| KeyName       | possible Inputs                                                                                              | Comment                                                                                      |
|---------------|--------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------|
| BASE          | ``"TILE"``,``"ACTOR"``,``"INTERACT"``,``"INTERACT_ACTOR"``,``"TILE_ACTOR"``,``"TILE_ACTOR"``,``"ACTOR"``     | describes which type of entities will be selected of the Effect, underscore means both types |
| SPECIFIC      |                                                                                                              | narrows down select of the the BASE-type by validating following possibillities:             |
| BASE          | uses the standard select from base                                                                           |                                                                                              |
| HAS_CONDITION | String of name of Condition-Class                                                                            |                                                                                              |
| HAS_STAT      | Array of three with name of ComponentClass,operator and value to validate ``["C_1_IS_WALKABLE","=","true"]`` |                                                                                              |
| HAS_TEXTURE   | String of Component **C_2_ANY_TEXTURE_ID**                                                                   |                                                                                              |
| CHANCE        | number from 0 up to 100 for its possibillity to trigger                                                      |                                                                                              |




## Effect  Slot


| KeyName       | possible Inputs                                                                                              | Comment                                                                                      |
|---------------|--------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------|
| BASE          | ``"TILE"``,``"ACTOR"``,``"INTERACT"``,``"INTERACT_ACTOR"``,``"TILE_ACTOR"``,``"TILE_ACTOR"``,``"ACTOR"``     | describes which type of entities will be selected of the Effect, underscore means both types |
| SPECIFIC      |                                                                                                              | narrows down select of the the BASE-type by validating following possibillities:             |
| BASE          | uses the standard select from base                                                                           |                                                                                              |
| HAS_CONDITION | String of name of Condition-Class                                                                            |                                                                                              |
| HAS_STAT      | Array of three with name of ComponentClass,operator and value to validate ``["C_1_IS_WALKABLE","=","true"]`` |                                                                                              |
| HAS_TEXTURE   | String of Component **C_2_ANY_TEXTURE_ID**                                                                   |                                                                                              |
| CHANCE        | number from 0 up to 100 for its possibillity to trigger                                                      |                                                                                              |