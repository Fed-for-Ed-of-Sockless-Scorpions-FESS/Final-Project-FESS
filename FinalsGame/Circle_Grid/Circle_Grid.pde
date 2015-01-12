int sz=40;
void setup() {
  size(800, 600);
}
void draw() {
  for (int x=0; x<=width; x+=70) {
    for (int y=0; y<= height; y+=60) {
      ellipse (x, y, sz, sz);
      fill(0);
      
    }
  }
}

