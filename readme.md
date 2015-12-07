#README

Interactive Information Visualisation  
December 8, 2015 – Assignment 2.1  
Francesco Vitale   <francesco.vitale@u-psud.fr>  


## Interaction
The application displays a map of French cities. To use it, open the file `infovis2015.pde`

### How to filter the cities displayed:

* Use the Arrow UP key to increase the minimum population. 
* Use the Arrow DOWN key to decrease the minimum population.

### How to see the name of a city

* Hover with the mouse on the circle representing a city to see its name.
* Click on the circle to select it. The name of the city will change color.

## Data encoding
The map displays the cities of France as dots. Their relative size and density is represented as an ellipse of varying size. To calculate the size of the ellipse, I first calculated the density of a city:

> density = population / surface

Then, I multiplied the density to the surface of the city, to give a proportional representation of the cities on the map (otherwise, a small but very dense town would appear to be as big as Paris, for example).

This number (density * surface) is divided by 2 and by a decimal factor, to calculate the radius of each ellipse.

The radius is then used to check when the mouse is hovering or picking a specific city.

## Resources
To complete the assignment I used the examples from the Processing documentation. In particular, for the keyboard interaction: https://processing.org/reference/keyCode.html 