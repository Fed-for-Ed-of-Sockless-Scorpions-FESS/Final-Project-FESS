spaceShip ship;                                             // declare classes, arraylists, integers and image
Cloud cloud;
ArrayList<Shooter> shoots = new ArrayList<Shooter> ();
ArrayList<Enemy> enemies = new ArrayList<Enemy>();
int rows = 4;
int columns = 10;
int mainVel = 1;
PImage sky;
int levelNumber = 1;

void setup() {                                              // initialize classes and load image
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
  image(sky, 0, 0, 800, 600);                               // display sky image
  
  textSize(40);                                             
  text("Level " + levelNumber, 20, 50);                     // displays what level you are on
  
  newLevel();                                               // call newLevel function

  
  cloud.display();                                          // make cloud display and move
  cloud.move();

  ship.display();                                           // make spaceship display and move
  ship.move();

  for (int i = 0; i< shoots.size (); i++) {                 // go through Shooter arraylist
    Shooter s = shoots.get(i);                              // get bullet(shooter) out of list
    s.display();                                            // display and move bullet
    s.move();
    if (s.flyAway()) {                                      // if flyAway is true, then remove bullet
      shoots.remove(i);
    }
  }

  for (int i = 0; i < enemies.size (); i++) {              // go through Enemy arraylist
    Enemy e = enemies.get(i);                              // get enemy out of list
    e.display();                                           // display, move, and bounce enemy
    e.move();
    e.bounce();
    e.gameover();                                          // if gameover conditions apply, show gameover screen
    for (int j = 0; j< shoots.size (); j++) {              // go through Shooter arraylist while still in the Enemy arraylist
      Shooter s = shoots.get(j);                           // get shooter out of arraylist
      if (s.destroy(e)) {                                  // if destroy is true, then remove that enemy and that bullet (shooter)
        enemies.remove(i);
        shoots.remove(j);
      }
    }
  }
}

void keyPressed() {                                        // make Shooter shoot when spacebar is pressed
  if (key == ' ') {
    shoots.add(new Shooter(ship));
  }
}

void newLevel() {                                         // declare newLevel function
  if (enemies.size() == 0) {                              // if no enemies exist then add new enemies and increase velocity and increase level

    for (int x = 0; x < columns; x++) {
      for (int y = 0; y < rows; y++) {
        enemies.add(new Enemy(80 + x * 50, 25 + y * 50, mainVel ));
      }
    }
    mainVel++;
    levelNumber++;
  }
}

