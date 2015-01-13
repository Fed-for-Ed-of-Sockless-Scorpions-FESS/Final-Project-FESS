

//PVector acc;
ArrayList<spaceShip> ship = new ArrayList<spaceShip> ();

void setup() {
  size (600, 800);
}

void draw() {
   println(ship.size());
   background(0);
  
  for (int i = ship.size() -1; i >= 0; i--) {
    spaceShip plane = ship.get(i);
    plane.display();
    plane.move();
  }
}

class spaceShip {
  float sz;
  PVector loc;
  PVector vel;

  spaceShip() {
    sz = 20;
    loc = new PVector(width/2, height *.9);
    vel = new PVector(0, -1);
  }

  void display() {
    ellipse(loc.x, loc.y, sz, sz);
  }

  void move () {
    if (keyPressed) {
      if (keyCode == RIGHT && loc.x + sz/2 < width) {
        loc.x ++;
      }
      if (keyCode == LEFT && loc.x - sz/2 > 0) {
        loc.x --;
      }
    }
  }
}







