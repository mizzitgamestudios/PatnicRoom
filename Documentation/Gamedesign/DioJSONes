



# DioJSONes
- [Introduction](#introduction)
- [Convention](#conventions)
- [Types](#types)
	* [Archivements](#Archivements)
	*  [ASCII_Art](#ASCII_Art)
	*  [Anatomy](#Anatomy)
	*  [Cars](#Cars)
	*  [Chunk_Keywords](#Chunk_Keywords)
	*  [Conditions](#Conditions)
	*  [Factions](#Factions)
	*  [Flags](#Flags)
	*  [Item_Descriptions](#Item_Descriptions)
	*  [Races](#Races)
	*  [Roles](#Roles)
	*  [Specialties](#Specialties)
	*  [Statistics](#Statistics)






## Introduction
Each JSON file is a list of objects
```json
[
  {
    "Key1": "Value1"
  },
  {
    "Key2": "Value2"
  }
]
```

**Needed Keys**
* Each object needs a type-key which defines how DioJSONes will parse and interpret data into the game.
[see the list of types for reference.](#DUMMY)
* Each object needs an id-key to make them retraceable.
The ID is set together by name and type, separated by underscore.
```json
{
"type":	"skill",
"name":	"acrobatics",
"ID":	"acrobatics_skill"
}
```
| common keys | meaning |
|--|--|
| ID | unique String to Identify data |
| name | one worded description for reference |
| description |Text which will be shown to player for more information |


**Template**
For comfort and to minimice parsing errors,every type of JSON-files has in its folder a Template.
make sure to copy it into a new Textfile and customice the placeholder to your actual content.


## Conventions
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

## Types
| Types                 | Description                                           |
|-----------------------|-------------------------------------------------------|
| Archivements          | Milestones which player has reached in a game once    |
| Anatomy               | Bodyparts of diffrent races                           |
| ASCII_Art             | Predefined texts                                      |
| Cars                  | drones which can transport player                     |
| Chunk_Keywords        | Keywords for attributes of Chunk                      |
| Conditions            | Effects on the Body by external factors               |
| Factions              | Attributes of groups of people                        |
| Flags                 | valueless Components for plausibillity-checks         |
| Item_Description      | hover over text of Items                              |
| Item_Type             | defaultvalue for categories of Items                  |
| Loot_Table            | probabillity of items by looting                      |
| Races                 | Attributes of diffrent Races                          |
| Roles                 | Attributes of diffrent Roles                          |
| Specialties           | Attributes of diffrent Specialties                    |
| Statistics            | Stats of last Playthrough                             |
|                       |                                                       |
|                       |                                                       |
| Cyberware_Module      | kind                                                  |
| Cyberware_Integration | technique of Integration to the Body                  |
| Cyberware_Appendix    | Appendixs for customication                           |
|                       |                                                       |
| Hacks_Module          | Effect                                                |
| Hacks_Target          | like data or device                                   |
| Hacks_Appendix        | Appendixs for customication                           |
|                       |                                                       |
| Drone_Frame           | Body                                                  |
| Drone_Movement        | like propellent or wheels                             |
| Drone_Sensory         | kind of perception                                    |
|                       |                                                       |
| Spell_Effect          | Effect                                                |
| Spell_Medium          | type of movement on the map                           |
| Spell_Appendix        | Appendixs for customication                           |
|                       |                                                       |
| Infusion_Effect       | Effect on the body                                    |
| Infusion_Bodypart     | how and where its added                               |
| Infusion_Appendix     | Appendixs for customication                           |
|                       |                                                       |
| Summoning_Force       | Stats of Ghost                                        |
| Summoning_Behaviour   | priorities                                            |
| Summoning_Appendix    | Appendixs for customication                           |
|                       |                                                       |
| Weapon_Frame          | Body                                                  |
| Weapon_Sight          | effective range                                       |
| Weapon_Ammunition     | type of damage                                        |
|                       |                                                       |
| Armor_Coating         | protection of diffrent Threats                        |
| Armor_                |                                                       |
| Armor_Appendix        | Appendixs for customication                           |

## Descriptions
ID, Name and Type are not mentioned in following Lists but a must have are mandatory.
Rows which are spaced of the Top are not mandatory.
###  Archivements
| Key                   | Description                                           |
|-----------------------|-------------------------------------------------------|
|                       |                                                       |
### ASCII_Art
| Key                   | Description                                           |
|-----------------------|-------------------------------------------------------|
| String                | Array of String of Textfile                           |
###  Anatomy
| Key                   | Description                                           |
|-----------------------|-------------------------------------------------------|
| base_hp               | healthpoints,deficit can cause need of Cyberware      |
| connects              | link to other bodyparts                               |
| hit_probabillity      | determinds probabillity of getting hit in percent     |
|                       |                                                       |
| kit                   | ID of an Kit like Cyberware or Infusion               |
### Cars

### Chunk_Keywords
| Key                   | Description                                           |
|-----------------------|-------------------------------------------------------|
| Factions              | List of object with faction_ID and number in relation to each other of their membercount|

### Conditions

### Factions
| Key                   | Description                                           |
|-----------------------|-------------------------------------------------------|
| ingame_name           | calling of group                                      |
| hostile               | List of Text with Factions which they attack on sight |
| neutral               | List of Text with Factions where they stay alert      |
| friendly              | List of Text with Factions where they are cooperative |
| role_probabillity     | List of object with role_ID and number of % to spawn  |
| tier_probabillity     | List of 3 Numbers with % of to Spawn                  |
### Flags

### Item_Descriptions

### Loot_Table
| Key                   | Description                                           |
|-----------------------|-------------------------------------------------------|
| chunk_possibillity    | List of Text with chunk_keywords where possible       |
| chunk_probabillity    | List of Numbers of Probabillity in percent            |
| items                 | List of Obects of Text and Number with ID and %       |
### Races

### Roles

### Specialties

###  Statistics
