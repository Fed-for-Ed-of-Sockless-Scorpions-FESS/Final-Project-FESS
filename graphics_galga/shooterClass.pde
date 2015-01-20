class Shooter {
  float sz;
  PVector loc;
  PVector vel;


  Shooter(spaceShip ship) {
    sz = 20;
    loc = new PVector(ship.loc.x, ship.loc.y);
    vel = new PVector(0, -3);
  }

  void display() {
    ellipse(loc.x, loc.y, sz, sz);
  }

  void move() { 
    loc. add(vel);
  }

  boolean destroy(Enemy monster) {
    if (loc.dist(monster.loc) < sz/2 + monster.sz/2) {
      return true;
    } else {
      return false;
    }
  }
}

