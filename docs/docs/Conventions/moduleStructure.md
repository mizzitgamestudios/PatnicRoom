
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
