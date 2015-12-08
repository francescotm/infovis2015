class Place {
  int postalcode;
  String name;
  float x;
  float y;
  float population;
  float surface;
  float density;
  int radius;
  boolean highlighted;
  boolean selected;
  
  // method to create new Place
  Place(int postalcode, float x, float y, String name, float population, float surface) {
    this.name = name;
    this.postalcode = postalcode;
    this.x = x;
    this.y = y;
    this.population = population;
    this.surface = surface;
  }
  
  void draw() {
    color earth = color(51,130,117); // green
    // draw small points on map
    set((int)mapX(x), (int)mapY(y), earth);    
    radius = (int) mapRadius(population,surface);
    
    if (highlighted) {
      // highlight ellipse
      stroke(252,245,184);
      strokeWeight(2);
      
      if (selected) {
        fill(202,75,124); // red
      } else {
        fill(earth,300); // green
      }
      ellipse((int)mapX(x), (int)mapY(y), radius, radius);
      
      // show city name
      String name = this.name;
      float textWidth = textWidth(name);
      fill(53,57,64); // grey
      noStroke();
      rect((int)mapX(x) + (radius/2) + 10, (int)mapY(y) - 10, textWidth + 10, 20);
      
      // select city or not
      if (selected) {
        fill(202,75,124); // red
      } else {
        fill(250,255,250); // white
      }
      text(name, (int)mapX(x) + (radius/2) + 15, (int)mapY(y) + 5);
    } else {
       noStroke();
       if (selected) {
         fill(202,75,124,150); // red
       } else {
         fill(earth, 150); // green
       } 
       ellipse((int)mapX(x), (int)mapY(y), radius, radius);
    }  
    noLoop();
  }
  
  // mapping position
  float mapX(float x){
    return map(x, minX, maxX, 50, 800);
  }
  float mapY(float y){
    return map(y, minY, maxY, 800, 50);
  }
  
  // mapping density
  float mapRadius(float population, float surface) {
    return ((population/surface)*surface)*0.00005;
  }
  
  // checking if poin in ellipse
  boolean contains(int px, int py) {
    return dist(mapX(x), mapY(y), px, py) <= (radius/2) + 1;
  }
  
  // on mouse hover
  void highlight() {
    this.highlighted = true;
  }
  void noHighlight() {
    this.highlighted = false;
  }
  
  // on mouse click
  void select() {
    this.selected = true;
  }
  void noSelect() {
    this.selected = false;
  }
}