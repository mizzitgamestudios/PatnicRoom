## Styleguide


### General
- we use for variables camelCaseLikeThisForExample

- private variables start with an underscore to "hide" them in _functioncalls()

- we use static typing as much as possible
  * for a declaration,we set a blankspace in front of the Datatype:   
    ``var number: int``
  * for Parameters in functions,we cramp them together:   
    ``func foo(add:int,print:String):``
  * for Arrays and Dictionaries,we dont type them when we set their equal:  
    ``var toPrint = []``

* however there are times where we want to stay in dynamic Typing.  
  We use a hybrid to to duckType, ecspecially at diffrent kinds of entites.
  you can guess that parameters or variables which are named like "ent" use a fluid Class instance.  
  And to my pardon,you need to do this until GD-Script can declare Interfaces
  ( hints would be appreciated,guys I really want some Interfaces D; )
