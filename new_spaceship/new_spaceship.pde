spaceShip ship;                          
ArrayList<Shooter> shoots = new ArrayList<Shooter> ();
ArrayList<Enemy> enemies = new ArrayList<Enemy>();
int rows = 4;
int columns = 10;
int mainVel = 1;
//
int count= 35;
PImage cloud;
PVector[] loc= new PVector[count];
PVector[] vel= new PVector[count];
PVector[] acc= new PVector[count];
float[] sz= new float[count];
PImage sky;
//
void setup() {
  size (800, 600);
  //
  cloud= loadImage("coud.png");
sky= loadImage("sky11.png");
  for (int i=0; i< count; i++) {
    sz[i]= random(30, 50);
    loc[i]= new PVector(random(width), random(-height* 1.5, -sz[i]/2));
    vel[i]= new PVector(0, random(0.5));
    acc[i]= new PVector(0, .001);
  }
  //
  ship = new spaceShip();
  
  for (int x = 0; x < columns; x++) {
    for (int y = 0; y < rows; y++) {
      enemies.add(new Enemy(80 + x * 50, 25 + y * 50, mainVel));
    }
    textSize(70);
  }
}

void draw() {
  background(0);
  //
  image(sky,0,0,800,600);
  for (int i= 0; i<count; i++) {
    vel[i].add(acc[i]);
    loc[i].add(vel[i]);
    vel[i].limit(3);
    image(cloud, loc[i].x,loc[i].y, sz[i], sz[i]);
    acc[i].x= random(-.01, .01);
    if (loc[i].y -sz[i]/2 > height) {
      loc[i].set(random(width), random(-height, -sz[i]/2));
      vel[i].set(0, 1);
    }
  }
  //
  
  newLevel();
  ship.display();
  ship.move();
  for (int i = 0; i< shoots.size (); i++) {
    Shooter s = shoots.get(i);
    s.display();
    s.move();
    if (s.flyAway()) {
      shoots.remove(i);
    }
  }
  for (int i = 0; i < enemies.size (); i++) {
    Enemy e = enemies.get(i);
    e.display();
    e.move();
    e.bounce();
    e.gameover();


    for (int j = 0; j< shoots.size (); j++) {
      Shooter s = shoots.get(j);
      if (s.destroy(e)) {
        enemies.remove(i);
        shoots.remove(j);
      }
    }
  }
 
  }


void keyPressed() {
  if (key == ' ') {
    shoots.add(new Shooter(ship));
  }
}

void newLevel() {
  if (enemies.size() == 0) {
    mainVel++;
    for (int x = 0; x < columns; x++) {
      for (int y = 0; y < rows; y++) {
        enemies.add(new Enemy(80 + x * 50, 25 + y * 50, mainVel ));
      }
    }
  }
}

