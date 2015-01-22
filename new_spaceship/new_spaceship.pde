spaceShip ship;  
Cloud cloud;
ArrayList<Shooter> shoots = new ArrayList<Shooter> ();
ArrayList<Enemy> enemies = new ArrayList<Enemy>();
int rows = 4;
int columns = 10;
int mainVel = 1;
PImage sky;

void setup() {
  size (800, 600);
  sky= loadImage("sky11.png");
  cloud = new Cloud();
  ship = new spaceShip();
  for (int x = 0; x < columns; x++) {
    for (int y = 0; y < rows; y++) {
      enemies.add(new Enemy(80 + x * 50, 25 + y * 50, mainVel));
    }
  }
}

void draw() {
  background(0);

  newLevel();

  image(sky, 0, 0, 800, 600);
  cloud.display();
  cloud.move();

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

