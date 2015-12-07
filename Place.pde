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
  
  Place(int postalcode, float x, float y, String name, float population, float surface) {
    this.name = name;
    this.postalcode = postalcode;
    this.x = x;
    this.y = y;
    this.population = population;
    this.surface = surface;
  }
  
  void draw() {
    color earth = color(51,130,117);
    set((int)mapX(x), (int)mapY(y), earth);    
    radius = (int) mapRadius(population,surface);
    
    if (highlighted) {
      stroke(252,245,184);
      strokeWeight(2);
      fill(earth,300);
      ellipse((int)mapX(x), (int)mapY(y), radius, radius);
      
      String name = this.name;
      float textWidth = textWidth(name);
      fill(53,57,64);
      noStroke();
      rect((int)mapX(x) + (radius/2) + 10, (int)mapY(y) - 10, textWidth + 10, 20);
      
      if (selected) {
        fill(202,75,124);
      } else {
        fill(250,255,250);
      }
      text(name, (int)mapX(x) + (radius/2) + 15, (int)mapY(y) + 5);
    } else {
       noStroke();
       fill(earth, 150); 
       ellipse((int)mapX(x), (int)mapY(y), radius, radius);
    }  
    
    
    noLoop();
  }
  
  // mapping position
  float mapX(float x){
    return map(x, minX, maxX, 0, 800);
  }
  float mapY(float y){
    return map(y, minY, maxY, 900, 0);
  }
  
  // mapping density
  float mapRadius(float population, float surface) {
    return ((population/surface)*surface)*0.00005;
  }
  
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