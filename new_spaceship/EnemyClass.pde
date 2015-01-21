class Enemy {
  PVector loc;
  PVector vel;
  float sz;

  Enemy(float x, float y, float tempVel) {
    loc = new PVector(x, y);
    vel = new PVector(tempVel, .1);
    sz = 30;
  }

  void display() {
    ellipse(loc.x, loc.y, sz, sz);
  }

  void move() {
    loc.add(vel);
  }

  void bounce() {
    if (loc.x + sz/2 > width || loc.x - sz/2 < 0) {
      vel.x *= -1;
    }
  }

  void gameover() {
    if (loc.y+sz/2>height) {
      background(0);
      text("Game Over!", width/2-175, height/2);
    }
  }

//  void newLevel() {
//    if (enemies.size() == 0) {
//      vel.x++;
//      for (int x = 0; x < columns; x++) {
//        for (int y = 0; y < rows; y++) {
//          enemies.add(new Enemy(80 + x * 50, 25 + y * 50));
//        }
//      }
//    }
//  }
}

