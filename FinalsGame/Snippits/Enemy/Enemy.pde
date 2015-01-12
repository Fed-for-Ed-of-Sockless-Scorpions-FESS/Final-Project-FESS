ArrayList<Enemy> enemies = new ArrayList<Enemy>();

int rows = 4;
int columns = 10;

void setup() {
  size(800, 600);
  for (int x = 0; x < columns; x++) {
    for (int y = 0; y < rows; y++) {
      enemies.add(new Enemy(80 + x * 80, 25 + y * 50));
    }
  }
}
void draw() {
  for (int i = 0; i < enemies.size (); i++) {
    Enemy e = enemies.get(i);
    e.display();
  }
}

