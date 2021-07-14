

# Effect-Syntax





# Trigger Specific




| keyword | name | unit | stat | toString | inputModule | 
|  --  |  --  |  --  |  --  |  --  |  --  | 
| BASE | basic Trigger | TRIGGER | SPECIFIC | dont reduces selects any further | VOID | 
| HAS_STAT | compare stat | TRIGGER | SPECIFIC | compare the stat X if its Y than Z | COMPARATOR | 
| HAS_TEXTURE | has texture | TRIGGER | SPECIFIC | if it has the textureID (put together by tileset-name,x,y) | TEXTURE | 
| IS_DOOR | is a door | TRIGGER | SPECIFIC | if it has the flag F_9_IS_DOOR | IS_DOOR | 
| HAS_FLAG | has Flag | TRIGGER | SPECIFIC | validates select if entity has COMP.FLAG | VOID | 
| HAS_CONDITION | has condition | TRIGGER | SPECIFIC | validates select if entity is affected by an Condition | CONDITION | 



# Space Source




| keyword | name | unit | stat | toString | inputModule | 
|  --  |  --  |  --  |  --  |  --  |  --  | 
| SELF | self | SPACE | SOURCE | source of the effect is the position of the player-character | VOID | 



# Space Medium




| keyword | name | unit | stat | toString | inputModule | 
|  --  |  --  |  --  |  --  |  --  |  --  | 
| LINEA | linea | SPACE | MEDIUM | draws a cross at soruce in all four direction,a directional input set the final select on the appropiated line | VOID | 
| SELECT | advanced search | SPACE | MEDIUM | selects every entity seen on screen (Tiles,Statics,Actors), specific triggers recommended | VOID | 
| AREA | circle area | SPACE | MEDIUM | draws a Circle at soruce | VOID | 
| LINEA | linea | SPACE | MEDIUM | draws a cross at soruce in all four direction,a directional input set the final select on the appropiated line | VOID | 


