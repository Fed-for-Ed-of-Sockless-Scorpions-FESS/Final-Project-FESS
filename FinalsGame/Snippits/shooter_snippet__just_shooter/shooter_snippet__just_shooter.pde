// float sz;
//  PVector loc;
//  PVector vel;

ArrayList<Shooter> shoots = new ArrayList<Shooter> ();

void setup() {
  size(600, 800);

  // sz = 20;
  // loc = new PVector(width/2, height *.9);
  //vel = new PVector(0, -3);
}

void draw() {
  background(0);
  println(shoots.size());
 
  //ellipse(loc.x, loc.y, sz, sz);
  //loc.add(vel);
  for (int i = 0; i< shoots.size (); i++) {
    Shooter s = shoots.get(i);
    s.display();
    s.move();
  }
}

void keyPressed(){
  if (key == ' ') {
      shoots.add(new Shooter());
    }
}


class Shooter {
  float sz;
  PVector loc;
  PVector vel;


  Shooter() {
    sz = 20;
    loc = new PVector(width/2, height *.9);
    vel = new PVector(0, -3);
  }

  void display() {
    ellipse(loc.x, loc.y, sz, sz);
  }

  void move() { 
    loc. add(vel);
  }
}

