## Entity Summary

### Introduction
Entities are usually simple data-container for a composition, however we append their capabillities to an extend by saving specific Components in variables and by  declaring some function.  
Our Main reason is readabillity, calling getComponents does not only takesup some space,its even needs a string (native name variable of Component) which worsens said first and makes it prone to exceptions.  
To indicate that they are to use like variables,their name is plain simple the variable with brackets, i.e: 

``
entity.position()
``

Therefor,we call them often by a proxy function to clear up and increase Stabillity.
  
  
### TileEntity
Our Fundamental brick of every Tilemap, its an instanced version of its Template which can be best edited with the Tiled! Tilemap editor,we use this tool not as a Tilemap Parser,but as an Tileset parser and Visualication for our content designers.
> [!NOTE] 
> **TileEntities are not used to draw the Tilemap ,the native Tilemap-Node can not  hold meta-data like Components.  
>Because of this we use an 2D Dictionary with pos as key and the instanceID of an TileEntity as value.**


|Component Name      | Usage   |
|--------------------|---------|
|C_7_TILE_STATIC_TILESET_NR | ***(int)*** number index in the tileset atlas, points on the Texture to draw      |
|layer               | ***(ENUM.SOKRATILES_LAYER)*** 2D Array which is part of the big Tilemap          |
|isWalkable          | ***(bool)*** Determinds if an Actor or static Interactable can stay on this pos         |
|textureID           | ***(int)*** actuall Texture to draw, momentarally needs tileset atlas maintainance by keeping track of it        |
|tileName            | ***(String)*** readable index of the instance, put together by the name of the tileset module and its X,Y on it       |
|description         | ***(String)*** simple String to give more info about its attributes           |
|magicNoise          | ***(int)*** its DIgital Footprint, negative consequences on electronics       |
|matrixNoise         |***(int)*** its Spiritual Footprint, negative consequences on magic         |
|uniqueComponents    | ***(Entity)*** Contains all other components which are not mandatory for a Tile       |
