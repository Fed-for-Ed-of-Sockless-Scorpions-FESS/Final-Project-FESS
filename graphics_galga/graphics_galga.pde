spaceShip ship;
ArrayList<Shooter> shoots = new ArrayList<Shooter> ();
ArrayList<Enemy> enemies = new ArrayList<Enemy>();
int rows = 4;
int columns = 10;

void setup() {
  size (800, 600);
  ship = new spaceShip();
  BlackBox.init(this);
  for (int x = 0; x < columns; x++) {
    for (int y = 0; y < rows; y++) {
      enemies.add(new Enemy(80 + x * 50, 25 + y * 50));
    }
    textSize(70);
  }
}

void draw() {
  background(0);
  ship.display();
  ship.move();
  for (int i = 0; i< shoots.size (); i++) {
    Shooter s = shoots.get(i);
    s.display();
    s.move();
    //s.destroy();
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
    if (BlackBox.isKeyDown(BlackBox.VK_SPACE) && BlackBox.isKeyDown(BlackBox.VK_LEFT)) {
      println("Both the 'A' key and the 'A' key are pressed!");
    }
  }

  void keyPressed() {
    if (key == ' ') {
      shoots.add(new Shooter(ship));
    }
  }

