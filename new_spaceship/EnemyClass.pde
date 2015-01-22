class Enemy {                                          // initialize class
  PVector loc;                                         // declare variables for location, velociy, size, and image
  PVector vel;  
  float sz;
  PImage enemy;

  Enemy(float x, float y, float tempVel) {             // initialize vaiables for class
    loc = new PVector(x, y);
    vel = new PVector(tempVel, .2);
    sz = 30;
    enemy= loadImage ("enemy.png");
  }

  void display() {                                      // display enemy
    image(enemy, loc.x, loc.y, sz, sz);
  }

  void move() {                                         // enemy moves left and right and down the screen
    loc.add(vel);
  }

  void bounce() {                                       // bounce enemies of side of the screen
    if (loc.x + sz/2 > width || loc.x - sz/2 < 0) {
      vel.x *= -1;
    }
  }

  void gameover() {                                     // shows game over screen when enemies reach Superman's location
    if (loc.y+sz/2>500) {    
      background(0);
      textSize(70);
      text("Game Over!", 200, 200);
      textSize(40);
      text("You made it to level  " + levelNumber, 200, 300);
      //text("to try again...press", 200, 400);
    }
  }
}
