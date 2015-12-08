//declare the min and max variables that you need in parseInfo
float minX, maxX;
float minY, maxY;
int totalCount; // total number of places
float minPopulation, maxPopulation;
float minSurface, maxSurface;
float minAltitude, maxAltitude;
Place city;
Place cities[];
int minPopulationToDisplay = 400;
Place pickedPlace;

void setup() {
  size(900, 800);
  readData();
}

void draw() {
  background(33,37,44); // blackish
  for (int i = 2; i < cities.length; i++) {
    if (cities[i].population > minPopulationToDisplay) {
      cities[i].draw();
      noLoop();
    }
  }
  // legend
  fill(255,255,255);
  text("Displaying cities with a population above " + minPopulationToDisplay, 10, 20);
}

void readData() {
  String[] lines = loadStrings("villes.tsv");
  //println(lines);
  parseInfo(lines[0]);
 
  cities = new Place[totalCount];
  
  for(int i = 2; i < totalCount; i++) {
    String pieces[] = split(lines[i], TAB);
    city = new Place(int(pieces[0]), float(pieces[1]), float(pieces[2]), pieces[4], float(pieces[5]), float(pieces[6]));
    cities[i] = city;
  }
}

void parseInfo(String line) {
  String infoString = line.substring(2); // remove the #
  String[] infoPieces = split(infoString, ',');
  totalCount = int(infoPieces[0]);
  minX = float(infoPieces[1]);
  maxX = float(infoPieces[2]);
  minY = float(infoPieces[3]);
  maxY = float(infoPieces[4]);
  minPopulation = float(infoPieces[5]);
  maxPopulation = float(infoPieces[6]);
  minSurface = float(infoPieces[7]);
  maxSurface = float(infoPieces[8]);
  minAltitude = float(infoPieces[9]);
  maxAltitude = float(infoPieces[10]);
}

// keyboard interaction 
// reference: https://processing.org/reference/keyCode.html
void keyPressed() {
  if (key == CODED) { // if press key
    if (keyCode == UP) { // if key is arrow up
      if (minPopulationToDisplay < (int)maxPopulation) { 
        minPopulationToDisplay = minPopulationToDisplay * 5; // increase min population to display
        redraw();
      }
    } else if (keyCode == DOWN) {
      if (minPopulationToDisplay > 16) {  
        minPopulationToDisplay = minPopulationToDisplay / 5; // decrease min population to display
        redraw();
      }
    } 
  } else {
    // do nothing
  }
}

// get place under point
Place pick(int px, int py) {
  pickedPlace = null;
  for (int i = cities.length - 1; i > 1; i--) { // loop through cities in reverse order
   if (cities[i].contains(px,py) && cities[i].population > minPopulationToDisplay) {
      pickedPlace = cities[i];
      cities[i].highlight(); // highlight picked place
    } else {
      cities[i].noHighlight(); // remove highlight from other places
   }
  }
  return pickedPlace;
}

// get place under point
Place click(int px, int py) {
  pickedPlace = null;
  for (int i = cities.length - 1; i > 1; i--) {
   if (cities[i].contains(px,py) && cities[i].population > minPopulationToDisplay) {
      pickedPlace = cities[i];
      cities[i].select(); // select picked place
    } else {
      cities[i].noSelect(); // remove selection from other places
   }
  }
  return pickedPlace;
}


// mouse interaction

void mouseMoved() {  
  Place pickedPlace = pick(mouseX, mouseY);
  
  if (pickedPlace != null) {
    println("The place is " + pickedPlace.name);
  }
  redraw();
}

void mouseClicked() {
  Place clickedPlace = click(mouseX, mouseY);
  
  if (clickedPlace != null) {
    println("The place clicked is " + clickedPlace.name);
  }
  redraw();

}