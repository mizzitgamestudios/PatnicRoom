# Ancient Engines


### Introduction
A good core of our development happens in our four Frameworks for gameplay, named after ancient Philosopher just because i like Gnosis and bad puns.
This is just a small introduction to their main usage and to give an Idea of their inner workings.


### DioJSONes for storage Gamedata
Named after Diogenes of sinope,the cynic.Which means "doglike" in a litteral sense, he was an "odd" Philosopher who represented a simple live.
just like his simple live, we want to give our content designer a comfortable time to designs actual elements while the other two of us are coding rules and logic.

it services as a structured folder with JSON-files with some conventions and even some Keywords which will be interpreted to special functions like a random number generator by writing " (RANGE) 3W20+5" for example.

The most important point is its dynamic constructor,its my try on a compromise on the easy but lacking in logic of Mark-up-languages and the broad possibillities of the scripting-language of Godot,which therefore needs at least a basic level of experience in software development.

you can look up "" or even "" for more Informations to this Idea :)


### SokraTILEs for graphical Tilemap
Which person is more suited for rendering the world and its inhabitants,than the man who also question them by their allegory of the cave.

We had some hard choices to make,on the one hand: we want to develop whereever the road takes us,so an abstract Map like dwarf fortress would be usefull.On the other hand,we also want to give as much people as possible to at least try out our,so this kind of artstyle is exactly the hardest to get.

SokraTILEs is a weird lovechild of both worlds,highly recycling its assets but still with a grip in a visually pleasing world.
it also uses the Tiled!-editor what means there are plenty of ways to mod each tile and even to draw your own maps.
The Tileset can be dynamicly appended by just drawing them on a separate PNG , adding properties in Tiled and dragging and dropping them into the corresponding folder


### DemocrECTS for procedural/modular Game-elements
Democretus lived around 400 BC and got a weird idea: "what if every we can precive is made out such tiny things we can not physically see".
His take on atomism was mindblowing for his time,so it would make sense to use its idea for our ECS.

long story short: an ECS is a special type of saving data which makes them so barebones and independent,it can be combined with another to get new symbiotic effects. just like atoms,they are so abstract that they are not splittable any further.

 this,ecspecially in combination to the other three frameworks,we can design possible interactions,whether than actual scenes.there is a highly likely chance you will discover something in your playthrough we did not even know, not even intendend to implement.


### AresPROCGENes for procedural/modular Game-elements


 if DemocrECTS enables the small but weird Items you can carry and spells you can cast, AresPROCGENes does the heavy lifting to amp it up to an entropic eleven.It manages the generation of the 100x100 Area where you move,fills it with interesting buildings and persons, and gives you new intereseting challenges on the next one.
