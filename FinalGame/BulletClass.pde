class Bullet {                                                     // initialize class
  float sz;                                                        // declare variables for location, velociy, size, and image
  PVector loc;
  PVector vel;
  PImage bullet;

  Bullet(Superman character) {                                     // initialize variable for class and load image
    sz = 20;
    loc = new PVector(character.loc.x, character.loc.y);
    vel = new PVector(0, -3);
    bullet= loadImage ("bullet.png");
  }

  void display() {                                                  // display bullet
    image(bullet, loc.x, loc.y, sz, sz);
  }

  void move() {                                                     // allows bullet to move up on the screen towards enemy
    loc.add(vel);
  }

  boolean destroy(Enemy monster) {                                  // makes enemy and bullet disappear when bullet touches enemy
    if (loc.dist(monster.loc) < sz/2 + monster.sz/2) {
      return true;
    } else {
      return false;
    }
  }

  boolean flyAway() {                                               // removes bullet when reaches top of screen
    if (loc.y + sz/2 < 0) {
      return true;
    } else { 
      return false;
    }
  }
}
