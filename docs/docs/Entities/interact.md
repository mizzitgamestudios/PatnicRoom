# Interactables



## Introduction
Those Entities are in between Tiles and Actors.

Much like Tiles, they are static and can not change their position on the Tilemap. But they are able to be part of a greater narrative, just like Actors.  
Actors can usually not walk on Interactables and are reactionary. 
  
**The most important Components are:**  

| <h3 style="width:200px"> **Component-name** </h3>          | <h3 style="width:200px"> **Usage** </h3>           |  
|------------------------------------------------------------|----------------------------------------------------|  
| C_67_ANY_POSITION                                          | selecting for kits                                 |    
| C_2_TEXTURE_ID                                             | indexing for Templates                             |  
| C_1_ANY_IS_WALKABLE                                        | Acessabillity for Actors                           |  



<br>  
## universal Components
The following Components are the lowest common anominator for Tiles.
#### General

| <h3 style="width:119px"> **function** </h3> | <h3>**Type**</h3> | <h3 style="width:200px"> **Usage** </h3> | <h3 style="width:160px"> **Notation** </h3> |  
|------------------|---------|-------------------------------------------------|-----------------------------------------------------------------------------------------------|
| description      | String  | fluff and lore shown in onlook-action           | recommended length is 40 characters at max                                                    |
| textureID        | String  | toString() of staticTilesetNR                   | is a convention of 3 fields with "_" as IFS:<br>  ``Tileset_Row_Collumn``                     |
| layer            | Integer | name of layer where its mapped                  | convention of ``ENUM.SOKRATILES_LAYER.``X``_GROUND``<br> X for ``MEAT`` ``MATRIX`` ``MAGIC``  |
| tileName         | String  | oneliner reference                              | recommended length is 2 words at max                                                          |
| staticTilesetNR  | Integer | index number of corresponding Texture           | not recommended for freqeunt use.   please use textureID for improved readabillity.           |  

#### Spacial
| <h3 style="width:119px"> **function** </h3> | <h3>**Type**</h3> | <h3 style="width:200px"> **Usage** </h3> | <h3 style="width:160px"> **Notation** </h3> |   
|------------------|---------|-------------------------------------------------|-----------------------------------------------------------------------------------------------|
| type             | ENUM    | identifier to differenciate from other entities | convention of ``ENUM.TYPES_ON_MAP.TILE``                                                      |
| isWalkable       | BOOLEAN | Determinds if Actors can stand on Tile          |                                                                                               |
| mouseHover_quack | String  | duck-typed proxy-function to show on Mousehover |                                                                                               |
| pos              | Vector2 | position of Entity on x and y on Tilemap        | posX and posY can be for single getter. <br>  Are Converted from Double to Integer!           |  

#### Influencial
| <h3 style="width:119px"> **function** </h3> | <h3>**Type**</h3> | <h3 style="width:200px"> **Usage** </h3> | <h3 style="width:160px"> **Notation** </h3> |  
|------------------|---------|-------------------------------------------------|-----------------------------------------------------------------------------------------------|
| matrixNoise      | Integer | negative modifier for sourrunding Electronics   | WIP                                                                                           |
| magicNoise       | Integer | negative modifier for sourrunding Magics        | WIP                                                                                           |
      



<br>
## Quickreferences
| <h3 style="width:200px"> **Keyword** </h3>                        | <h3 style="width:200px"> **Description** </h3>   |  
|-------------------------------------------------------------------|--------------------------------------------------|  
| <h3>[Tile Atlas](Atlas/tiles.md)</h3>                             | All Tiles and their Attributes                   |    
| <h3>[Texture Atlas](Atlas/texture.md)</h3>                        | All Tiles and their Attributes                   |
| <h3>[Apply Conditions](../../Cogsmos/heGEL#Apply Conditions)</h3> | Types of triggers to attach Conditions on Tiles  |  
| <h3>[Tilemap Layer](../../Cogsmos/heGEL#Apply Conditions)</h3>    | functions to manipulate Tilemaps                 |  