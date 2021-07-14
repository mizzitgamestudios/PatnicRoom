# democrECS

## Introduction
Named after Democitus and his atomic theory, This System is about modularicing and composing of unique Game-elements.

ECS stands for ``Entity-Component-System`` and is a Data-oriented Design for fast loading and flexible instances. Here a short summary of those three things: 
   
1. *E* ntity  
`` Is an object with diffrent kinds of Dictionaries full of Components like a collection/composition referenced by its Object-id``      
    
2. *C* omponent  
`` Is an object with just one value, this is our replacement for private variables of instances``

3. *S* ystem  
`` Is an Object which replaces the functions of an instance. This System is shared between all  Entities``



<br><br>
## Getting Started

### Entities
| <h3 style="width:00px"> **function** </h3> | <h3>**Return Type**</h3> | <h3 style="width:100px"> **Notation** </h3>                     |  
|---------------------------------------------|------------------|-------------------------------------------------------------------------|
| getCompValue(String)                        | not typed        | list of Children can be found in ``COMP.ATLAS_INDEX_COMP``              |
| getCompTempValue(String, String)            | not typed        | 1st Parameter : name of Template <br> 2nd Parameter : name of Component |
|                                             |                  |                                                                         |
| addComponent(Component-child)               | void             | list of Children can be found in ``COMP.ATLAS_INDEX_COMP``              |
| addTemplate(String,Entity)                  | void             | list of Children can be found in ``COMP.ATLAS_INDEX_COMP``              |
|                                             |                  |                                                                         |
| removeComponent(String)                     | void             | free() the component and deletes itself from List                       |






<br><br>
## Personal changes to the design

### functioncalls for variable-references
due to readabillity, we choose to append Entities by proxy-like functions.  
    
Every advanced Entity has some lowest common anominator   
(for example every TileEntity has the Component ``C_1_ANY_IS_WALKABLE``). 
   
Instead of:  
```
var isWalkable = tileToWalkOn.getComponent("C_1_ANY_IS_WALKABLE").value;  
```  
  
We recommend: 
```
var isWalkable = tileToWalkOn.isWalkable();  
```


<br><br>
### predefined sets of Component as Templates  
sometimes there is a pattern of reacurring Components  
(for example every Actor has 4 Physical Attirbutes).

Instead Of:
```
var dwarfActor              = ActorEntity.new();

var compBase                = "C_X_ATTRIBUTE_"
var attributesValues        = [4,4,3,1]; # stats of Dwarf
var attributesComponents    = ["STRENGH","REACTION,"CONSTITUTION","AGILLITY"];

for i in attributesComponents.size():
    var currentCompToString = compBase + attributesComponent[i]
    var currentCompValue    = attributesValues[i]   

    var componentclass      = COMP.ATLAS_INDEX_COMP.GET(currentAttributeToString)
	var currentBodyPart     = componentClass.new(currentCompValue);


	dwarfActor.addComponent(component);

print( dwarfActor.getCompValue("C_X_ATTIBUTE_STRENGTH) )

``` 
We recommend:
```
var dwarfActor    = Entity.new();
var dwarfTemplate = API_001_Atlas.RaceAtlas()["DWARF"]

dwarfActor.addTemplate("DWARF",dwarfTemplate)
print( dwarfActor.getCompTempValue("DWARF","C_X_ATTRIBUTE_STRENGH") )

```   
This is a reference by pointer and is ideal for instances of Comps where it is unlikely to be used in the near future.  
in case of value-change, we instanciate this Component beforehand and use them in the usual way.   



<br><br>

