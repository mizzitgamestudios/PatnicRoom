## JSON Konvention


#### Namings
* Collumns of EffektEntity (TIME,TRIGGER,SPACE,EFFECT) are called Slots
* Rows of EffektEntity (like SPAWN,ONSET,HIT,OFFSET) are called Units


#### TIME-Slot
* N/A -> Not available, will jump to the next Unit of Slots
* 0   -> Till be triggered at the instant the UserInput is pressed
* X   -> Times of UserInputs before its triggered

#### TRIGGER-Slot
1. BASE                 -> Necessary field,describes the method of triggering
  * PROJECTILE_HIT    -> Effect travels over Tilemap and will be activated by actor or interactable when they match their position
  * SELF              -> When being self,almost every time triggering,except if mental stunned
  * TOUCHING          -> Effects will be activated by staying next to the wanted posiition and selecting its direction
  * SELECT            -> Selects all marked Tiles

2. SPECIFIC             -> Further conditions, things in brackets have to be on the right side sepratet with "_"
  * BASE              -> No further specification
  * HAS_CONDITION(X)  -> Name Of Condition it should check before it uses its Condition/statmod on the right side
  * HAS_STAT(X)(y)(z) -> Is triggered when the X stat of target Y-comparator is true to Z
  * CHANCE(X)         -> Can only be used after another Unit of Slots and will trigger by X percent
  * TILE_WHEN_REACHED


#### SPACE-Slot
1. MEDIUM        -> Way of travel to the target
  * LINEA      -> From SOURCE to Crosshair-select
  * AREA       -> From SOURCE to Area-select
  * LINEA_AREA -> From SOURCE to Crosshair-select and from there Area-select, separated by "_"
  * SELECT     -> *needs TRIGGER-SPECIFIC*, selects everything that HAS_X

  * SELF       -> to Player
  * TARGET     -> to last selected target


2. SOURCE        -> Starting Position on Tilemap
  * SELF       -> starts at player and counts from there
  * LAST_HIT   -> starts from hit of the Last Slot
  * TARGET     -> to last selected target
  * LAST_TARGET-> starts from target of Last Slot,regardless of SPECIFIC was met

3. REACH      -> X on the right side for number of Tiles it travels

4. M_TYPE        -> Layer of map for Target-selection
  * MEAT       ->
  * MAGIC      ->
  * MATRIX     ->


#### EFFECT-Slot
1. [CONDITION]          -> Is an empty List,needs following 3 decriptors per entry
  1. *condition name* -> Unique Identifier
  2. *intensity*      -> Factor of effect,when its static,insert a 0
  3. *duration*       -> Length of Effect in UserInputs

2. [STAT_MOD]             -> Is an empty List,needs 2 descriptors per entry
  1. *statistic name* -> Unique Identifier
  2. *modifier*       -> Will be inserted as addition
