class Enemy {
  PVector loc;
  PVector vel;
  float sz;

  Enemy(float x, float y) {
    loc = new PVector(x, y);
    vel = new PVector(1.5,.1);
    sz = 30;
  }
  void display() {
    ellipse(loc.x, loc.y, sz, sz);
  }
  void move(){
  loc.add(vel);
  }
  void bounce(){
  if (loc.x + sz/2 > width || loc.x - sz/2 < 0) {
      vel.x *= -1;
    }
  }
}

