int count = 3;
PVector[] loc = new PVector [count];
PVector[] vel = new PVector [count];
float[] sz = new float [count];

void setup() {
  size (600, 800);
  for (int i = 0; i < count; i++) {
    sz[i] = 30;
    loc[i] = new PVector(width/2, height *.9);
    vel[i] = new PVector(0, -1);
  }
}

void draw() {
  //println(ship.size());
  background(0);
  for (int i = 0; i < count; i++) {
    ellipse(loc[i].x, loc[i].y, sz[i], sz[i]);
    if (keyPressed) {
      if (keyCode == RIGHT && loc[i].x + sz[i]/2 < width) {
        loc[i].x ++;
      }
      if (keyCode == LEFT && loc[i].x - sz[i]/2 > 0) {
        loc[i].x --;
      }
    }
  }
}


//class spaceShip {
//  float sz;
//  PVector loc;
//  PVector vel;
//
//  spaceShip() {
//    sz = 20;
//    loc = new PVector(width/2, height *.9);
//    vel = new PVector(0, -1);
//  }
//
//  void display() {
//    ellipse(loc.x, loc.y, sz, sz);
//  }
//
//  void move () {
//    if (keyPressed) {
//      if (keyCode == RIGHT && loc.x + sz/2 < width) {
//        loc.x ++;
//      }
//      if (keyCode == LEFT && loc.x - sz/2 > 0) {
//        loc.x --;
//      }
//    }
//  }
//}
//

