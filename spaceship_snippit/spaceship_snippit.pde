float sz;
PVector loc;
PVector vel;
float sz2;
PVector loc2;
//PVector acc;


void setup() {
  size (600, 800);
  sz = 20;
  sz2 = 5;
  loc = new PVector(width/2, height *.9);
  loc2 = new PVector(width/2, height *.9);
//  acc = new PVector(0, .01);
  vel = new PVector(0, -1);
}

void draw() {


  ellipse(loc.x, loc.y, sz, sz);
  ellipse(loc2.x, loc2.y, sz2, sz2);
  if (keyPressed) {
    if (keyCode == RIGHT && loc.x + sz/2 < width) {
      loc.x ++;
    }
    if (keyCode == LEFT && loc.x - sz/2 > 0) {
      loc.x --;
    }
    
  }
  if (keyCode== UP) {
      //if (keyPressed) {
      //if (key == ' ') {
      loc2.add(vel);
//      vel.add(acc);
      //      loc2.y --;
    }
}



//if(loc.x + sz/2 > width) {
//  
//}


//class ship {
//  float sz;
//  float loc;
//  float vel;
//  
//  spaceShip() {
//    sz = 20;
//    loc = (width/2, height * .9);
//    
//    //vel = 
//  }
//}

