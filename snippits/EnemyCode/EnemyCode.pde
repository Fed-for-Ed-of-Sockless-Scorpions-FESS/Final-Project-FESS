ArrayList<Enemy> enemies = new ArrayList<Enemy>();

int rows = 4;
int columns = 10;

void setup() {
  size(800, 600);
 
  for (int x = 0; x < columns; x++) {
    for (int y = 0; y < rows; y++) {
      enemies.add(new Enemy(80 + x * 50, 25 + y * 50));
    }
  }
   textSize(70); 
}
void draw() {
   background(0);
  for (int i = 0; i < enemies.size (); i++) {
    Enemy e = enemies.get(i);
    e.display();
    e.move();
    e.bounce();
    e.gameover();
  }
}

