Spaceship A2 = new Spaceship();
Star[] starfield = new Star[500];
ArrayList <Asteroid> asteroids = new ArrayList <Asteroid>();
ArrayList <Bullet> bullets = new ArrayList <Bullet>();

boolean W = false;
boolean A = false;
boolean S = false;
boolean D = false;
boolean Shift = false;
boolean is_shooting = false;
boolean WeaponSwap1 = false;
boolean WeaponSwap2 = false;
//boolean voidShift = false;

float speed = 5;
float starSpeed = 2;
float fuel = 100;

public void setup() {
  	//fullScreen();
	size(1080,720);
	A2.setX(width/2);
	A2.setY(height/2);
	for (int i = 0; i < starfield.length; i++) {
		starfield[i] = new Star();
	}
	/*for (int i = 0; i < rocks.length; i++) {
		rocks[i] = new Asteroid();
	}*/
	for (int i = 0; i < 16; i++) {
		asteroids.add(new Asteroid());
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
	/*for (int i = 0; i < rocks.length; i++) {
		rocks[i].show();
		rocks[i].move();
	}*/
	for (int i = 0; i < asteroids.size(); i++) {
		asteroids.get(i).show();
		asteroids.get(i).move();
		float ship_check = dist(A2.getX(), A2.getY(), asteroids.get(i).getX(), asteroids.get(i).getY());
		if (ship_check < 20) {
			asteroids.remove(i);
		}
	}

	for (int i = 0; i < bullets.size(); i++) {
		bullets.get(i).show();
		bullets.get(i).move();
	}
	
	if (is_shooting == true) {shoot();}
}

public void keyPressed()  {
  if ((key == 'w')||(key=='W')) {W = true;}
  if ((key == 's')||(key=='S')) {S = true;}
  if ((key == 'a')||(key=='A')) {A = true;}
  if ((key == 'd')||(key=='D')) {D = true;}
  if ((key == ' ')) {is_shooting = true;}
  if (key == CODED) {
  	if (keyCode == SHIFT) {
  		Shift = true;
  	}
  }
  if ((key == 'q')||(key == 'Q')) {WeaponSwap1 = true; WeaponSwap2 = false;}
  if ((key == 'e')||(key == 'E')) {WeaponSwap2 = true; WeaponSwap1 = false;}
}

public void keyReleased()  {
  if ((key == 'w')||(key=='W')) {W = false;}
  if ((key == 's')||(key=='S')) {S = false;}
  if ((key == 'a')||(key=='A')) {A = false;}
  if ((key == 'd')||(key=='D')) {D = false;} 
  if ((key == ' ')) {is_shooting = false;}
  if (key == CODED) {
  	if (keyCode == SHIFT) {
  		Shift = false;
  	}
  }
}

public void shoot() {
	bullets.add(new Bullet(A2));
}
