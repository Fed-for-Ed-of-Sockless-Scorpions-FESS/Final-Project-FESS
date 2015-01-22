class Enemy {                                 //initiaze class
  PVector loc;                                  // declare variables for location, velociy, size, and images
  PVector vel;  
  float sz;
//
PImage enemy;
//
  Enemy(float x, float y, float tempVel) {       // initialize vaiable for class
    loc = new PVector(x, y);
    vel = new PVector(tempVel, .1);
    sz = 30;
    enemy= loadImage ("enemy.png");
  }

  void display() {                             // comand drawing enemy
   // ellipse(loc.x, loc.y, sz, sz);
    image(enemy,loc.x, loc.y, sz, sz);
  }

  void move() {                                   // comand for moving left and right and down the screen
    loc.add(vel);
  }

  void bounce() {
    if (loc.x + sz/2 > width || loc.x - sz/2 < 0) {    // alowes enemies to bounce off sides of screens when they touch the side or screeen 
      vel.x *= -1;
    }
  }

  void gameover() {                                     // shows game over screen when enemies reach supermans location
    if (loc.y+sz/2>height) {
      background(0);
      text("Game Over!", width/2-175, height/2);
    }
  }


}

