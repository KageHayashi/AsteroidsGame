Spaceship A2 = new Spaceship();
Star[] starfield = new Star[500];
Asteroid[] rocks = new Asteroid[5];

boolean W = false;
boolean A = false;
boolean S = false;
boolean D = false;
boolean shift = false;

float speed = 5;
float starSpeed = 2;

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
    //starfield[i].update();
	}
	for (int i = 0; i < rocks.length; i++) {
		rocks[i].show();
		rocks[i].move();
	}
}

public void keyPressed()  {
  if ((key == 'w')||(key=='W')) {W = true;}
  if ((key == 's')||(key=='S')) {S = true;}
  if ((key == 'a')||(key=='A')) {A = true;}
  if ((key == 'd')||(key=='D')) {D = true;}
  if (key == ' ') {
    A2.setX(Math.random()*800);
    A2.setY(Math.random()*800);
  }
  if (key == CODED) {
  	if (keyCode == SHIFT) {
  		shift = true;
  	}
  }
}

public void keyReleased()  {
  if ((key == 'w')||(key=='W')) {W = false;}
  if ((key == 's')||(key=='S')) {S = false;}
  if ((key == 'a')||(key=='A')) {A = false;}
  if ((key == 'd')||(key=='D')) {D = false;} 
  if (key == CODED) {
  	if (keyCode == SHIFT) {
  		shift = false;
  	}
  }
}
