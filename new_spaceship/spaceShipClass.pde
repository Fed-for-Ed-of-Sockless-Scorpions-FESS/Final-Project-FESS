class spaceShip {                                        // initialize class
  PVector loc;                                           // declare variables for location, size, and image
  float sz;
  PImage superman;

  spaceShip() {                                          // initialize variables and load image
    sz = 74;                                              
    loc = new PVector(width/2, height *.85);
    superman= loadImage ("superman.png");
  }

  void display() {                                       // display Superman
    image(superman, loc.x, loc.y, sz, sz);
  }

  void move () {                                         // allows Superman to move right or left when key pressed but not off screen
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

