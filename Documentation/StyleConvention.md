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


### Modules
My Project structure follows an Systemic design pilosophy, its goal is toappend new themes of Features as an Module-folder,which acts like a Blackbox. The only Accespoint is their SIngleton API which saniticies, validates or logs if neccessary.
  
Here are the conversioned Namespaces and their Usage:  
 

|Namespace                   | Usage                                                                            |
|----------------------------|----------------------------------------------------------------------------------|
|Controller                  | Folder for foreign related Classes                                               |
| > API                      |  proxy functions with Saniticer,Validator and/or Logger                          |
| > Logger                   | Used ingame Eventlog and Entropy counter                                         |
| > Validators               | checks in- and outputs on their right type and validity                          |
| > CompIndex                | Dictionary of all new Comps Of Module,needed for their instancing via JSON       |
| Components                 | Folder with all new data containers                                              |
| Entity Manager             | Folder with Classes for instanciating,freeing,changing Entities                  |
| IO                         | Folder With InputClass which connects Signals to API and OutputClass which emits |
| System                     | all kinds of blackbooxed Logical Computation                                     |
| Unit Test                  | Classes for Unit Testing                                                         |









