Spaceship A2 = new Spaceship();
Star[] starfield = new Star[500];
Asteroid[] rocks = new Asteroid[5];
boolean accel = false;
boolean rotateL = false;
boolean rotateR = false;

public void setup() {
	size(800,800);
	A2.setX(width/2);
	A2.setY(height/2);
	for (int i = 0; i < starfield.length; i++) {
		starfield[i] = new Star();
	}
	for (int i = 0; i < rocks.length; i++) {
		rocks[i] = new Asteroid();
	}

  noCursor();
}
public void draw() {
	background(0);
	A2.show();
	A2.move();
	for (int i = 0; i < starfield.length; i++) {
		starfield[i].show();
	}
	for (int i = 0; i < rocks.length; i++) {
		rocks[i].show();
		rocks[i].move();
		rocks[i].turn(((int)Math.random()*20));
	}
  if (accel == true)A2.accelerate(.1);
  if (rotateL == true)A2.turn(-5);
  if (rotateR == true)A2.turn(5);
}

public void keyPressed() {
	if (key == CODED) {
		if (keyCode == UP) {
			accel = true;
		}
		if (keyCode == LEFT) {
			rotateL = true;
		}
		if (keyCode == RIGHT) {
			rotateR = true;
		}
	}
		if (key == ' ') {
			A2.setX((int)(Math.random()*800));
			A2.setY((int)(Math.random()*800));
			A2.accelerate(0);
      A2.setPointDirection(0);
			A2.setDirectionX(0);
			A2.setDirectionY(0);
	}
  if (keyCode == DOWN) {
    A2.setDirectionX(0);
    A2.setDirectionY(0);
  }
}

void keyReleased() {
  if (key == CODED) {
    if (keyCode == UP) {
      accel = false;
    }
    if (keyCode == LEFT) {
      rotateL = false;
    }
    if (keyCode == RIGHT) {
      rotateR = false;
    }
  }
}
