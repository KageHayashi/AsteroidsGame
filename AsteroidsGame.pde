Spaceship A2 = new Spaceship();
Star[] starfield = new Star[500];
ArrayList <Asteroid> asteroids = new ArrayList <Asteroid>();
ArrayList <Bullet> bullets = new ArrayList <Bullet>();

ProgressBAR Health_Bar = new ProgressBAR(50,650);
ProgressBAR Shield_Bar = new ProgressBAR(49,665);
ProgressBAR SMDR = new ProgressBAR(800,650);
//ArrayList <ProgressBAR> bars = new ArrayList <ProgressBAR>();

boolean W = false;
boolean A = false;
boolean S = false;
boolean D = false;
boolean Shift = false;
boolean is_shooting = false;
boolean Weapon0 = true;
boolean Weapon1 = false;
boolean Weapon2 = false;
//boolean voidShift = false;

float speed = 5;
float starSpeed = 2;
float fuel = 100;

int mouseWheelUP = 0;
int mouseWheelDOWN = 0;

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
		if (ship_check < 30) {
			asteroids.remove(i);
			Shield_Bar.decreaseI(50);
		}
		if (Shield_Bar.getI() == 0) {

		}
	}

	for (int i = 0; i < bullets.size(); i++) {
		bullets.get(i).show();
		bullets.get(i).move();
	}
	
	if (is_shooting == true) {shoot();}
	if (mouseWheelDOWN > 0) {textSize(26); text("1",5,20);}
	if (mouseWheelUP > 0) {textSize(26); text("2",5,20);}

	Health_Bar.show();
	Health_Bar.setSize(19);
	Health_Bar.colorFill(255,0,0);
	Shield_Bar.show();
	Shield_Bar.setSize(5);
	Shield_Bar.colorFill(0,0,255);
	SMDR.show();
	SMDR.setSize(19);
	SMDR.colorFill(5,255,5);
	text("SUPER MEGA DEATH ROCKET", 50,800);

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
  //if ((key == 'q')||(key == 'Q')) {WeaponSwap1 = true; WeaponSwap2 = false;}
  //if ((key == 'e')||(key == 'E')) {WeaponSwap2 = true; WeaponSwap1 = false;}

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
	if (frameCount % 5 == 0) {
		bullets.add(new Bullet(A2));
	}
}
	

void mouseWheel(MouseEvent event) {
	float e = event.getCount();
	if (e > 0) {
		mouseWheelDOWN++;
		mouseWheelUP = 0;
		if (mouseWheelDOWN > 0) {
			Weapon0 = false; Weapon1 = true; Weapon2 = false;
		}
	}
	else if (e < 0) {
		 mouseWheelUP++;
		 mouseWheelDOWN = 0;
		 if (mouseWheelUP > 0) {
		 	Weapon0 = false; Weapon1 = false; Weapon2 = true;
		 }
	}

}