class spaceShip {
  PVector loc;
  float sz;
  PImage superman;

  spaceShip() {
    sz = 30;

    loc = new PVector(width/2, height *.9);
   
  }

  void display() {

    ellipse(loc.x, loc.y, sz, sz);
  }

  void move () {
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

