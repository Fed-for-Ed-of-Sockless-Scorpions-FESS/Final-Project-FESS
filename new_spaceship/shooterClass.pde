class Shooter {                //initiaze class
  float sz;                     // declare variables for location, velociy, size, and images
  PVector loc;
  PVector vel;
PImage bullet;

  Shooter(spaceShip ship) {                     // initialize vaiable for class
    sz = 20;
    loc = new PVector(ship.loc.x, ship.loc.y);
    vel = new PVector(0, -3);
    bullet= loadImage ("bullet.png");
  }

  void display() {                                // comand drawing fire/ bullet
   // ellipse(loc.x, loc.y, sz, sz);
    image(bullet,loc.x, loc.y, sz, sz);
  }

  void move() {                             // alows bullet to move up oon the screen towards enemy
    loc. add(vel);
  }

  boolean destroy(Enemy monster) {                                 // makes enemy disapear when bullet touches enemy
    if (loc.dist(monster.loc) < sz/2 + monster.sz/2) {
      return true;
    } else {
      return false;
    }
  }

  boolean flyAway() {                                        // removes bullet when reaches top of screen
    if (loc.y - sz/2 < 0) {
      return true;
    } else { 
      return false;
    }
  }
}

