# Effects



## Introduction
Effects are the Backbone of the cause and effects of the Gameworld.  
They change stats of entities and apply conditions.  
Effects are often happening by Kitsets of Actors but can also be triggered by reactions of Interactables.  
  
**Effects have 4 Phases, called Slots**  

| <h3 style="width:200px"> **Syntax** </h3>          | <h3 style="width:400px"> **Annotation** </h3>           |  
|------------------------------------------------------------|----------------------------------------------------|  
| SPAWN                                          | Before its appearance on the Tilemap                                 |    
| ONSET                                             | On The Tilemap before it tries to take effect on the Target                              |  
| EFFECT                                        | after it hitted the Target                            |  
| OFFSET                                        | after the Main effect and bevore it despawns of the Tilemap                           |  
  
**every Slot has 4 Categories to descirbe their attributes,called units**  

| <h3 style="width:200px"> **Syntax** </h3>          | <h3 style="width:400px"> **Annotation** </h3>           |  
|------------------------------------------------------------|----------------------------------------------------|  
| TIME                                          | Time by actions of the effects that happens                                  |    
| TRIGGER                                             | Validates if the Entity can be effected                              |  
| SPACE                                        | Movement on the Tilemap                            |  
| EFFECT                                        | Effects on entity                           |  


<br>  

## You can find the whole Syntax here



<br>
## Quickreferences
| <h3 style="width:200px"> **Keyword** </h3>                        | <h3 style="width:200px"> **Description** </h3>   |  
|-------------------------------------------------------------------|--------------------------------------------------|  
| <h3>[Tile Atlas](Atlas/tiles.md)</h3>                             | All Tiles and their Attributes                   |    
| <h3>[Texture Atlas](Atlas/texture.md)</h3>                        | All Tiles and their Attributes                   |
| <h3>[Apply Conditions](../../Cogsmos/heGEL#Apply Conditions)</h3> | Types of triggers to attach Conditions on Tiles  |  
| <h3>[Tilemap Layer](../../Cogsmos/heGEL#Apply Conditions)</h3>    | functions to manipulate Tilemaps                 |  