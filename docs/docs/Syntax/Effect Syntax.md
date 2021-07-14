

## Time Slot

| <h4 style="width:110px">**Key-name**</h4> | <h4 style="width:330px">**Possible Inputs**</h4>                                           | <h4 style="width:200px">**Annotation**</h4>                                                  |
|--------------------|-------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------|
| TIME-0             | number as String for rounds of actions                                                                            | SPAWN-Slot                                                                                   |
|                    |                                                                                                                   |                                                                                              |
| TIME-1             | number as String for rounds of actions                                                                            | ONSET-Slot                                                                                   |
|                    |                                                                                                                   |                                                                                              |
| TIME-2             | number as String for rounds of actions                                                                            | EFFECT-Slot                                                                                  |
|                    |                                                                                                                   |                                                                                              |
| TIME-3             | number as String for rounds of actions                                                                            | OFFSET-Slot                                                                                  |

## Trigger Slot

| <h4 style="width:110px">**Key-name**</h4> | <h4 style="width:330px">**Possible Inputs**</h4>                                           | <h4 style="width:200px">**Annotation**</h4>                                                  |
|--------------------|-------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------|
| BASE               | ``"TILE"``, ``"ACTOR"``, ``"INTERACT"``, ``"INTERACT_ACTOR"``, ``"TILE_ACTOR"``, ``"TILE_ACTOR"``, ``"ACTOR"``    | describes which type of entities will be selected of the Effect, underscore means both types |
|                    |                                                                                                                   |                                                                                              | 
| SPECIFIC           | vvv                                                                                                               | narrows down select of the the BASE-type by validating following possibillities:             |
| ``"BASE"``         | uses the standard select from base                                                                                |                                                                                              |
| ``"HAS_CONDITION"``| String of name of Condition-Class                                                                                 |                                                                                              |
| ``"HAS_STAT"``     | Array of three with name of ComponentClass,operator and value to validate ``["C_1_IS_WALKABLE","=","true"]``      |                                                                                              |
| ``"HAS_TEXTURE"``  | String of Component **C_2_ANY_TEXTURE_ID**                                                                        |                                                                                              |
| ``"CHANCE"``       | number from 0 up to 100 for its possibillity to trigger                                                           |                                                                                              |

## Space Slot

| <h4 style="width:110px">**Key-name**</h4> | <h4 style="width:330px">**Possible Inputs**</h4>                                           | <h4 style="width:200px">**Annotation**</h4>                                                  |
|--------------------|-------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------|
| REACH              | String of a number                                                                                                |                                                                                              |
|                    |                                                                                                                   |                                                                                              |
| M_TYPE             | ``"MEAT"``, ``"MAGIC"``, ``"MATRIX"``                                                                             |                                                                                              |
|                    |                                                                                                                   |                                                                                              |
| MEDIUM             |  vvv                                                                                                              |                                                                                              |
| ``"AREA"``         |  Draws a circle around the valid valid entities                                                                   |                                                                                              |
| ``"LINEA"``        |  Draws a Cross around the valid entities, one Direction has to be selected                                        |                                                                                              |
| ``"LINEA_AREA"``   |  follows ``LINE`` and when valid trigger is found draws ``AREA``                                                  |                                                                                              |
| ``"SELF"``         |  selects Player-position                                                                                          |                                                                                              |
| ``"SELECT"``       |  Fetches all entities in a Diamond shape                                                                          |                                                                                              |
|                    |                                                                                                                   |                                                                                              |
| SOURCE             |  vvv                                                                                                              |                                                                                              |
| ``"SELF"``         |  Starts to draw by Player-position                                                                                |                                                                                              |

## Effect Slot

| <h4 style="width:110px">**Key-name**</h4> | <h4 style="width:330px">**Possible Inputs**</h4>                                           | <h4 style="width:200px">**Annotation**</h4>                                                  |
|--------------------|-------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------|
| CONDITION          | Array of Condition to set with intensitiy and duration (if needed) ``["Cond_BAN_Electrifying","1","1"]``          | You can find the Whole Atlas here                                                            |
|                    |                                                                                                                   |                                                                                              |
| STAT_MOD           |                                                                                                                   | You can finde the Whole Atlas here                                                           |
