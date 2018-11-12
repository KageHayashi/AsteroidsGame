Spaceship A2 = new Spaceship();
Star[] starfield = new Star[500];
Asteroid[] rocks = new Asteroid[5];

boolean W = false;
boolean A = false;
boolean S = false;
boolean D = false;

float speed = 5;

public void setup() {
  //fullScreen();
	size(800,800);
	A2.setX(width/2);
	A2.setY(height/2);
	for (int i = 0; i < starfield.length; i++) {
		starfield[i] = new Star();
	}
	for (int i = 0; i < rocks.length; i++) {
		rocks[i] = new Asteroid();
	}

  //noCursor();
}
public void draw() {
	background(0);
	A2.show();
	A2.move();
  A2.accelerate();
  A2.turn();
	for (int i = 0; i < starfield.length; i++) {
		starfield[i].show();
	}
	for (int i = 0; i < rocks.length; i++) {
		rocks[i].show();
		rocks[i].move();
	}
}

/**public void keyPressed() {
	if (key == CODED) {
		if (keyCode == UP) {
			up = true;
		}
		if (keyCode == LEFT) {
			left = true;
		}
		if (keyCode == RIGHT) {
			right = true;
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
}*/

public void keyPressed()  {
  if ((key == 'w')||(key=='W')) {W = true;}
  if ((key == 's')||(key=='S')) {S = true;}
  if ((key == 'a')||(key=='A')) {A = true;}
  if ((key == 'd')||(key=='D')) {D = true;}
  if (key == ' ') {
    A2.setX(Math.random()*800);
    A2.setY(Math.random()*800);
  }
}

public void keyReleased()  {
  if ((key == 'w')||(key=='W')) {W = false;}
  if ((key == 's')||(key=='S')) {S = false;}
  if ((key == 'a')||(key=='A')) {A = false;}
  if ((key == 'd')||(key=='D')) {D = false;} 
}
