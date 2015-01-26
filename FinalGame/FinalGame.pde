Superman character;                                         // declare classes, arraylists, integers and image
Cloud cloud;
ArrayList<Bullet> fire = new ArrayList<Bullet> ();
ArrayList<Enemy> enemies = new ArrayList<Enemy>();
int rows = 4;
int columns = 10;
int mainVelx = 1;
float mainVely = .1;
int levelNumber = 1;
int screen = 1;
PImage sky;
PImage keys;
PImage spacebar;
PImage background;
PFont mono;

void setup() {                                              // initialize classes and load image and font
  size (800, 600);
  sky = loadImage("sky11.png");
  keys = loadImage("keys.png");
  spacebar = loadImage("spacebarNew.png");
  background = loadImage("FlyingSupermanBackground.jpg");
  mono = loadFont("Monotxt_IV50-48.vlw");
  textFont(mono);
  cloud = new Cloud();
  character = new Superman();
  for (int x = 0; x < columns; x++) {
    for (int y = 0; y < rows; y++) {
      enemies.add(new Enemy(80 + x * 50, 25 + y * 50, mainVelx, mainVely));
    }
  }
}

void draw() {
  if (screen == 1) {                                          // opening screen
    image(background, 0, 0, width, height);
    textSize(60);
    text("Superhero Rescue", 60, 145);
    textSize(25);
    text("press ENTER to continue", 200, 500);
  }

  if (screen == 2) {                                          // directions screen
    background(0);
    textSize(50);
    text("Directions!", 200, 100);
    textSize(25);
    text("Shoot the red monsters before ", 80, 175);
    text("they come too close to Superman.", 80, 225);
    textSize(30);
    text("press     to move left and right", 80, 300);
    image(keys, 200, 275, keys.width/3, keys.height/3);
    text("press           to shoot", 80, 400);
    image(spacebar, 200, 375, spacebar.width/2, spacebar.height/2);
    text("press ENTER to start", 80, 500);
  }

  if (screen == 3) {
    image(sky, 0, 0, width, height);                               // display sky image

    textSize(40);                                             
    text("Level " + levelNumber, 20, 50);                     // displays what level you are on

    newLevel();                                               // call newLevel function

    cloud.display();                                          // make cloud display and move
    cloud.move();

    character.display();                                      // make superman display and move
    character.move();

    for (int i = 0; i< fire.size (); i++) {                  // go through bullet arraylist
      Bullet f = fire.get(i);                                // get bullet out of list
      f.display();                                           // display and move bullet
      f.move();
      if (f.flyAway()) {                                     // if flyAway is true, then remove bullet
        fire.remove(i);
      }
    }

    for (int i = 0; i < enemies.size (); i++) {              // go through Enemy arraylist
      Enemy e = enemies.get(i);                              // get enemy out of list
      e.display();                                           // display, move, and bounce enemy
      e.move();
      e.bounce();
      e.gameover();                                          // if gameover conditions apply, show gameover screen
      for (int j = 0; j< fire.size (); j++) {                // go through bullet arraylist while still in the Enemy arraylist
        Bullet f = fire.get(j);                              // get bullet out of arraylist
        if (f.destroy(e)) {                                  // if destroy is true, then remove that enemy and that bullet
          enemies.remove(i);
          fire.remove(j);
        }
      }
    }
  }
  if (screen ==4) {                                          // game over screen
    background(0);
    textSize(70);
    text("Game Over!", 170, 200);
    textSize(35);
    text("You made it to level " + levelNumber, 120, 300);
  }
}

void keyReleased() {                                        // make bullet shoot when spacebar is released
  if (key == ' ') {
    fire.add(new Bullet(character));
  }
  if (key == ENTER) {                                       // switch to next screen when enter is released
    screen++;
    screen = constrain(screen, 0, 3);
  }
}

void newLevel() {                                         // declare newLevel function
  if (enemies.size() == 0) {                              // if no enemies exist then add new enemies and increase velocity and increase level

    for (int x = 0; x < columns; x++) {
      for (int y = 0; y < rows; y++) {
        enemies.add(new Enemy(80 + x * 50, 25 + y * 50, mainVelx, mainVely));
      }
    }
    mainVelx++;
    mainVely = mainVely + .1;
    levelNumber++;
  }
}

