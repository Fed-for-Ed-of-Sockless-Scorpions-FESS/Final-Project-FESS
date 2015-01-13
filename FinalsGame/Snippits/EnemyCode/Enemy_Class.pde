class Enemy {
  PVector loc;
  PVector vel;
  float sz;

  Enemy(float x, float y) {
    loc = new PVector(x, y);
    sz = 30;
  }
  void display() {
    ellipse(loc.x, loc.y, sz, sz);
  }
  //void move(){
  //
  //}
  //void bounce(){
  //  
  //}
}

