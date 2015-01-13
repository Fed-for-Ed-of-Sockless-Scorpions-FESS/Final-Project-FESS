spaceShip [] s = new spaceShip [3];

void setup() {
  size (600, 800);
  for (int i = 0; i < s.length; i++) {
    s[i] = new spaceShip();
  }
}

void draw() {
  background(0);
  for (int i = 0; i < s.length; i++) {
    s[i].display();
    s[i].move();
  }
}

