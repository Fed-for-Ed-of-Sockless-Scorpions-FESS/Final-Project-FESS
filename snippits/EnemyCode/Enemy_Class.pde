class Enemy {
  PVector loc;
  PVector vel;
  float sz;

  Enemy(float x, float y) {
    loc = new PVector(x, y);
    vel = new PVector(1, .1);
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
}

