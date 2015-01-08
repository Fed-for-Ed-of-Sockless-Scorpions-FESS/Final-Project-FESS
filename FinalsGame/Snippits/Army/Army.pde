int count = 30;
PVector [] loc = new PVector [count];
PVector [] vel = new PVector [count];
PVector [] acc = new PVector [count];
float [] sz = new float [count];

void setup(){
 size (800,600); 
 for (int i = 0; i < count; i++) {
    sz[i] = 40;
    loc[i] = new PVector(random(100,500), random(40,200));
    vel[i] = new PVector(1, .1);
    acc[i] = new PVector(0, 0);
   
  }
}

void draw(){
 background(0);
for (int i = 0; i < count; i++) {
    vel[i].add(acc[i]);
    loc[i].add(vel[i]);
ellipse(loc[i].x, loc[i].y, sz[i], sz[i]);
if (loc[i].x + sz[i]/2 > width || loc[i].x - sz[i]/2 < 0) {
      vel[i].x *= -1;
    }
    if (loc[i].y + sz[i]/2 > height) {
      text("game over", 400,300);
    }
}
}
