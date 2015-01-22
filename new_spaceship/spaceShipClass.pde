class spaceShip {                                  //initialize class
  PVector loc;                                       // declare variables for location, size, and images
  float sz;
  PImage superman;

  spaceShip() {
    sz = 74;                                               // initialize vaiable for class
    loc = new PVector(width/2, height *.85);
    superman= loadImage ("superman.png");
  }

  void display() {                                      // allows superman to be drawn
    image(superman, loc.x, loc.y, sz, sz);
  }

  void move () {                                       // allows superman to move right or left when key pressed but not off screen
    if (keyPressed) {
      if (keyCode == RIGHT && loc.x + sz/2 < width) {
        loc.x = loc.x + 3;
      }
      if (keyCode == LEFT && loc.x - sz/2 > 0) {
        loc.x  = loc.x - 3;
      }
    }
  }
}

