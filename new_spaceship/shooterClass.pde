class Shooter {
  float sz;
  PVector loc2;
  PVector vel;


  Shooter(spaceShip ship) {
    sz = 20;
    loc2 = new PVector(ship.loc.x, ship.loc.y);
    vel = new PVector(0, -3);
  }

  void display() {
    ellipse(loc2.x, loc2.y, sz, sz);
  }

  void move() { 
    loc2. add(vel);
  }
}

