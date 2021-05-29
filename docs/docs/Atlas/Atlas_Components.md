

# Components



| name | suggestion | description | validInputs | validType | nameToShow | 
|  --  |  --  |  --  |  --  |  --  |  --  | 
| C_0_ANY_DESCRIPTION | something offensive or hyperbolic,best case both | is shown to the player in things like mousehover or onlook-action | [] | STRING | lore-description | 
| C_1_ANY_IS_WALKABLE |  | determinds if an Actor can walk on this tile | [true, false] | validInputs | Walkable | 
| C_2_ANY_TEXTURE_ID | *tilesetname*_*rownumber*_*collumnumber* | Name of the Texture to be shown | [] | STRING | Texture-ID | 
| C_3_ANY_LAYER |  | determinds on which layer the entity is indexed on Map | [actors, pc, Meat ground, Meat interactables, Matrix ground, Matrix interactables, Magic ground, Magic interactables, selection, condition] | validInputs | Layer | 
| C_4_ANY_MAGIC_NOISE |  | determinds the handicap for sourronding dice tosses | [] | INTEGER | Magic Noise | 
| C_5_ANY_MATRIX_NOISE |  | determinds the handicap for sourronding dice tosses | [] | INTEGER | Matrix Noise | 
| C_6_TILE_NAME |  | short reference name shown in the most cases | [] | STRING | Name | 
| C_7_TILE_STATIC_TILESET_NR |  | Number of tile in Master-atlas | [] | INTEGER | static Tileset Number (do not fill) | 
| C_8_STRUCTURE_HP |  | Health for inanimated Objects | [] | INTEGER | Structural Healthpoint | 
| C_9_CREDITS_ACCOUNT |  | amount of money | [] | INTEGER | credits | 
| C_10_ACTOR_PERKS |  | determinds the handicap for sourronding dice tosses | [] | ARRAY | perks | 
| C_11_ACTOR_RACE_NAME |  | determinds basic attributes and relations | [] | STRING | Race | 
| C_13_ACTOR_ROLE_NAME |  | Groupname of Role | [] | STRING | Role category | 
| C_14_ACTOR_SPECIALTY_NAME | recommended length 2-3 words | short name reference | [] | STRING | Specialty name | 
| C_15_ACTOR_ARRAY_BODYPARTS |  | All Bodypart-template of Race | [] | CONTAINER | List of All BOdyparts | 
| C_16_ACTOR_BODYPARTS_CONNECTS |  | connected Bodyparts | [] | ARRAY | list of linked bodyparts | 
| C_17_ACTOR_BODYPARTS_HITPROBABILLITY |  | Bodypart hit % | [] | INTEGER | propabillity to get random hit in percent | 
| C_18_ACTOR_ATTRIBUTEMOD |  | Attribute mod | [] | NULL | modulacation of C_19, we recommend C_19 for usage | 
| C_19_ACTOR_ATTRIBUTES |  | add modifiers to the biological potential of an Actors | [Strength:int, Agillity:int, Reaction:int, Constitution:int, Logic:int, Intuition:int, Charisma:int, Willpower:int] | DICTIONARY | Attributes | 
| C_20_ACTOR_SKILLBLOCK |  | List of all skills and their values | [] | DICTIONARY | Skillblock | 
| C_21_TILE_TILENAME | often the same as C_6, maybe shorter | often used Reference name | [] | STRING | Name | 
| C_22_ACTOR_LIMITS |  | max. succeses per dice-role | [] | INTEGER | Limits | 
| C_23_ACTOR_CARRIAGE |  | max units actor can carry | [] | INTEGER | Carriage capacity | 
| C_26_ACTOR_INDIRECT_STATS |  | name of its fightingstyle | [] | DICTIONARY | Indirect Stats | 
| C_27_ACTOR_RACIAL_ENEMIES |  | choose	races for prejudices | [] | ARRAY | racial enemies | 
| C_28_ACTOR_RACIAL_FRIENDS | yes this is reference | choose	races for pride | [] | ARRAY | racial friends | 
| C_29_ANY_LISTING_PRICE |  | the usual price when its bought | [] | INTEGER | listing price | 
| C_30_ANY_NEEDED_BACKPACK_SLOTS |  | name of its fightingstyle | [] | INTEGER | role description | 
| C_31_KIT_CAT_TYPE |  | type of kit of the Surv9 | [CYBERWARE, HACK, DRONE, INFUSION, SPELL, RITE, MEELE, GUN, ARMOR] | STRING | kit Category | 
| C_32_ANY_LIST_OF_CONDITIONS |  | name of its fightingstyle | [] | ARRAY | role description | 
| C_33_KIT_COOLDOWN_TIMER | guide value: Rarity*1 | by actions of player | [] | INTEGER | cooldown | 
| C_34_ANY_LOG_TO_STRING |  | is shown to the player in logs | [] | STRING | log entry | 
| C_35_KIT_MECHANICAL_SUMMARY | about 80 characters at max | shown as short explaination of usage | [] | STRING | summary | 
| C_36_KIT_MOD_TIME | guide value: Rarity*1,5 | number of Panicrooms before its usable | [] | STRING | setup time | 
| C_37_ANY_M_TYPE |  | name of its fightingstyle | [MEAT, MAGIC, MATRIX] | STRING | layer of perception | 
| C_38_KIT_PART_TYPE | Base: Main definition, Mod: Specialication, Appendix: Side-effect | place in Kitset | [BASE, MOD, APPENDIX] | INTEGER | kit Part | 
| C_40_ANY_TO_STRING |  | often as same as C_6 | [] | STRING | toString | 
| C_42_ROLE_VARIETY |  | name of its fightingstyle | [] | ARRAY | role description | 
| C_43_PLAYER_DESCRIPTION |  | Playername | [] | STRING | Playername | 
| C_44_PLAYER_STREETNAME |  | unique Title | [] | STRING | Streetname | 
| C_45_PLAYER_NAME |  | Playername | [] | STRING | Playername | 
| C_47_ANY_SYNONYM |  | list of differnt names for this spcialication | [] | ARRAY | synonyms | 
| C_48_ANY_RARITY | 1: Drek, 5: Fixer, 10: R&D-Prototype | chance to loot on a scale of 1 to 10 | [] | INTEGER | Rarity | 
| C_49_EFFECT_REFERENCE |  | name of its fightingstyle | [] | EFFECT | Is used to build EffectEntity | 
| C_50_ACTOR_ROLE_DESCRIPTION |  | like description a flavor-text | [] | STRING | role description | 
| C_51_PLAYER_KITSETS |  | name of its fightingstyle | [] | ARRAY | role description | 
| C_54_ANY_ENTITY_TYPE |  | name of its fightingstyle | [] | STRING | role description | 
| C_56_BASE_CONNECTOR |  | name of its fightingstyle | [] | STRING | role description | 
| C_58_ALTERNATIVE_TEXTURES |  | name of its fightingstyle | [] | STRING | role description | 
| C_59_KIT_MOD_CHANGE |  | name of its fightingstyle | [] | ARRAY | role description | 
| C_60_BASE_KIT_REFERENCE |  | choose the kit to specialice | [] | STRING | base-kit reference | 
| C_61_LOOT_TABLE |  | name of its fightingstyle | [] | DICTIONARY | role description | 
| C_62_LOOT_STATE |  | name of its fightingstyle | [] | STRING | role description | 
| C_63_APPLY_CONDITION_SPREADING |  | makes it able to spread fire | [] | STRING | burnable | 
| C_64_APPLY_CONDITION_WALKING |  | applies condition when walking on tile | [] | STRING | condition by walking | 
| C_65_TIER | on a scale of 1 to 10 | quality of Item | [] | INTEGER | tier | 

