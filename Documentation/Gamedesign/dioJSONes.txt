#dioJSONes
- [Convention](#Convention)
- [Types](#Types)
- [Constructors](#Constructors)



##Introduction
dioJSONes is my attempt of a compromise between Developer and Contentdesigner.

while developers have the necessary knowledge of Programming language and experience to implement functions of features,
they therefore have a lack of time to use this to implement instances of features in a game.

Contentdesigners have creative ideas and intuition for game elements but therefore no knowledge in the areas of development.

dioJSONes defines a set of naming conventions and special keywords which will be interpretet at the parsing of JSONs for special uses.
i.e:
* Constructors to instanciate Entities
* Inheritance of other JSON-files
* Systematic structure of data



##Convention

**Needed Keys**
* Each object needs a type-key which defines how DioJSONes will parse and interpret data into the game.
[see the list of types for reference.](#DUMMY)
* Each object needs an id-key to make them retraceable.
more info to its syntax is further down.

```json
{
"type":	"skill",
"name":	"acrobatics",
"ID":	"acrobatics_skill"
}
```

| common keys | meaning                                                         |
|-------------|-----------------------------------------------------------------|
| ID          | unique String to Identify data                                  |
| Name        | one worded description for reference                            |
| Description |Text which will be shown to player for more information          |


**Template**
For comfort and to minimice parsing errors,every type of JSON-files has in its folder a Template.
make sure to copy it into a new Textfile and customice the placeholder to your actual content.


**Units**
| Abbrevation | meaning |
|--|--|
|  |  |


**Comments**
To add a explanation of an Entry,type a new one above itself with the key "//" with the number of comment and your explanation as value.
```json
{
"//1":	"this is a comment to give an example of the syntax"
}
```


**Key-Naming**
the usual conevntion for porgrammers is to "separate" variables by camelCase (i.e "theQuickBrownFoxJumpsOverTheLazyDog").
but it may take some time to get used to it.So for comfort,Contentdesigner can use snake_case, i.e:
```json
{
"syntax":"the_quick_brown_fox_jumps_over_the_lazy_dog"
}
```
*note*: every word is written in lower case and the underscore happens at the front of the second word.

*explanation*: a underscore symbolices something is not overaching but closely relatet to the word before it


**ID-Naming**
like state,ID are very important,and even more is a static and reliable naming of them.
an ID starts with its grouping,groupings are sequentiall names of subfolders,separated with an take away(-)
in example: the data of upper_leg.json in "Config/Anatomy/metahuman/"
```json
{
"grouping_example":"A-Metahuman-"
}
```
*note*: groupings are Capitaliced

*explanation*: the take away symbolices in comparrison to the underscore a overaching thing which can have many things (in this case arms or heads) under itself.
							 the the subfolders before the last are cut short to their first letter.

after groupings,what follows is the name of the JSON-File itself.
in example: the data of upper_leg.json in "Config/Anatomy/metahuman/"
```json
{
"whole_ID":"Anatomy-Metahuman-upper_leg"
}
```

##Constructors
sometimes its usefull to have json defined thing in an other json,for example can we modify
stats by 


##Types
| Types                 | Description                                           |
|-----------------------|-------------------------------------------------------|
| Anatomy               | Bodyparts of diffrent races                           |
| ASCII_Art             | Predefined texts                                      |
| Chunk_Keywords        | Keywords for attributes of Chunk                      |
| Conditions            | Effects on the Body by external factors               |
|                       |                                                       |
| >Entities_Attributes  |                                                       |
|   ET_Race             | Attributes of diffrent Races                          |
|   ET_Roles            | Attributes of diffrent Roles                          |
|   ET_Specialties      | Attributes of diffrent Specialties                    |
|                       |                                                       |
| Factions              | groups of people                                      |
| Flags                 | valueless Components for plausibillity-checks         |
|                       |                                                       |
| >Items                |                                                       |
|  I_Consumables        | one time use items                                    |
|                       |                                                       |
| >Kits                 |                                                       |
| >>K_Electronics       |                                                       |
| >>>K_E_Cyberware      |                                                       |
|     K_E_C_Model       | Effect of Cyberware                                   |
|     K_E_C_Integration | Appliance of Cyberware                                |
|     K_E_C_Appendix    | Customiced expansion                                  |
| >>>K_E_Drone          |                                                       |
|     K_E_D_Frame       | basemodell of Drone                                   |
|     K_E_D_Movement    | i.e propellent or wheels                              |
|     K_E_D_Sensor      | i.e Infrared sight or sonar hearing                   |
| >>>K_E_Hack           |                                                       |
|     K_E_H_Daemon      | Effect of Hack                                        |
|     K_E_H_Target      | i.e data, persona or device                           |
|     K_E_H_Appendix    | Customiced expansion                                  |
| >>K_Magic             |                                                       |
| >>>K_M_Infusion       |                                                       |
|     K_M_I_Power       | Effect of Infusion                                    |
|     K_M_I_Bodypart    | Anatomical placement                                  |
|     K_M_I_Appendix    | Customiced expansion                                  |
| >>>K_M_Spell          |                                                       |
|     K_M_S_Formular    | Effect of Spell                                       |
|     K_M_S_Medium      | movement of map i.e instant or area                   |
|     K_M_S_Appendix    | Customiced expansion                                  |
| >>>K_M_Conjuration    |                                                       |
|     K_M_C_Force       | Effect of Cyberware                                   |
|     K_M_C_Behavior    | priority i.e healing                                  |
|     K_M_C_Appendix    | Customiced expansion                                  |
| >>K_Universal         |                                                       |
| >>>K_U_Armor          |                                                       |
|     K_U_A_Coating     | protection of external factors                        |
|     K_U_A_Matterial   | protection of damage                                  |
|     K_U_A_Appendix    | Customiced expansion                                  |
| >>>K_U_Gun            |                                                       |
|     K_U_G_Frame       | basemodell of Gun                                     |
|     K_U_A_Sight       | effective range                                       |
|     K_U_A_Ammunation  | damagetype                                            |
| >>>K_U_Meele          |                                                       |
|     K_U_M_Hitzone     | i.e blunt or sharp or punctual                        |
|     K_U_A_Shaft       | i.e handguard                                         |
|     K_U_A_Appendix    | Customiced expansion                                  |
|                       |                                                       |
| >Loot_Tables          |                                                       |
|   LT_Object           | probabillity of items i.e crates or save              |
|   LT_Entities         | probabillity of items i.e corpses                     |
|                       |                                                       |
| Statistics            | Stats of last Playthrough                             |
|                       |                                                       |
| >Meta                 |                                                       |
| >>M_Archivements      | Milestones which player has reached in a game once    |
