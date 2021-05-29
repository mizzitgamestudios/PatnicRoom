[Tiles](Entities/tile.md)  
[Interact](Entities/interact.md)  
[Actor](Entities/actor.md)  

[Kitpart](Entities/kitpart.md)  

[Effect](Entities/effect.md)  
[Condition](Entities/condition.md)    
[Symbiotic](Entities/symbiotic.md)
### Introduction
Entities are usually simple data-container for a composition, however we append their capabillities to an extend by saving specific Components in variables and by  declaring some function.  
Our Main reason is readabillity, calling getComponents does not only takesup some space,its even needs a string (native name variable of Component) which worsens said first and makes it prone to exceptions.  
To indicate that they are to use like variables,their name is plain simple the variable with brackets, i.e:

``
entity.position()
``

Therefor,we call them often by a proxy function to clear up and increase Stabillity.
