import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class AsteroidsGame extends PApplet {

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
	if (mouseWheelDOWN > 0) {textSize(26); text("1",5,20);}
	if (mouseWheelUP > 0) {textSize(26); text("2",5,20);}
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
	bullets.add(new Bullet(A2));
}

public void mouseWheel(MouseEvent event) {
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
class Asteroid extends Floater {
  private int rotSpeed;
  public Asteroid() {
    corners = 4;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = 10;
    yCorners[0] = 1;
    xCorners[1] = 1;
    yCorners[1] = -10;
    xCorners[2] = -10;
    yCorners[2] = -10;
    xCorners[3] = -10;
    yCorners[3] = 10;

    myCenterX = Math.random()*800;
    myCenterY = Math.random()*800;
    myDirectionX = Math.random()*5;
    myDirectionY = Math.random()*5;
    myPointDirection = Math.random()*360;

    rotSpeed = ((int)Math.random()*10-5);

    myColor = 175;
  }

  public void setX(double x) {myCenterX = x;}
  public int getX() {return (int)myCenterX;}
  public void setY(double y) {myCenterY = y;}
  public int getY() {return (int)myCenterY;}
  public void setDirectionX(double x) {myDirectionX = x;}
  public double getDirectionX() {return (int)myDirectionX;}
  public void setDirectionY(double y) {myDirectionY = y;}
  public double getDirectionY() {return (int)myDirectionY;}
  public void setPointDirection(int degrees) {myPointDirection = degrees;}
  public double getPointDirection() {return myPointDirection;}

  public void move() {
  	turn(rotSpeed);

    myCenterX += myDirectionX;
    myCenterY += myDirectionY;
    if(myCenterX >width)
    {
      myCenterX = 0;
    }
    else if (myCenterX<0)
    {
      myCenterX = width;
    }
    if(myCenterY >height)
    {
      myCenterY = 0;
    }

    else if (myCenterY < 0)
    {
      myCenterY = height;
    }
  }

}
class Bullet extends Floater {
	private float d,d1;
	public Bullet(Spaceship ship) {
		myCenterX = ship.getX();
		myCenterY = ship.getY();
		myPointDirection = (Math.atan2(mouseY - myCenterY,mouseX - myCenterX))/PI*180;
		double dRadians = myPointDirection*(Math.PI/180);
		myDirectionX = 5*Math.cos(dRadians);
		myDirectionY = 5*Math.sin(dRadians);
		d = 5;
		d1 = 5;
	}

	public void setX(double x) {myCenterX = x;}
    public int getX() {return (int)myCenterX;}
    public void setY(double y) {myCenterY = y;}
    public int getY() {return (int)myCenterY;}
    public void setDirectionX(double x) {myDirectionX = x;}
    public double getDirectionX() {return (int)myDirectionX;}
    public void setDirectionY(double y) {myDirectionY = y;}
    public double getDirectionY() {return (int)myDirectionY;}
    public void setPointDirection(int degrees) {myPointDirection = degrees;}
    public double getPointDirection() {return myPointDirection;}

    public void move() {
    	myCenterX += myDirectionX;   
    	myCenterY += myDirectionY; 
    }
    
    public void show() {
    	fill(255);   
    	stroke(255);  
    	ellipse((float)myCenterX, (float)myCenterY, d, d1);

    	if (Weapon0 == true) {d = 5; d1 = 5;}
    	if (Weapon1 == true) {d = 20;}
    	if (Weapon2 == true) {d = 50;d1 = 50;}
    }
}
abstract class Floater //Do NOT modify the Floater class! Make changes in the Spaceship class
{
  protected int corners;  //the number of corners, a triangular floater has 3
  protected int[] xCorners;
  protected int[] yCorners;
  protected int myColor;
  protected double myCenterX, myCenterY; //holds center coordinates
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel
  protected double myPointDirection; //holds current direction the ship is pointing in degrees
  abstract public void setX(double x);
  abstract public int getX();
  abstract public void setY(double y);
  abstract public int getY();
  abstract public void setDirectionX(double x);
  abstract public double getDirectionX();
  abstract public void setDirectionY(double y);
  abstract public double getDirectionY();
  abstract public void setPointDirection(int degrees);
  abstract public double getPointDirection();

  //Accelerates the floater in the direction it is pointing (myPointDirection)
  public void accelerate (double dAmount)
  {
    //convert the current direction the floater is pointing to radians
    double dRadians = myPointDirection*(Math.PI/180);
    //change coordinates of direction of travel
    myDirectionX += ((dAmount) * Math.cos(dRadians));
    myDirectionY += ((dAmount) * Math.sin(dRadians));
  }
  public void turn (int nDegreesOfRotation)
  {
    //rotates the floater by a given number of degrees
    myPointDirection+=nDegreesOfRotation;
  }
  public void move ()   //move the floater in the current direction of travel
  {
    //change the x and y coordinates by myDirectionX and myDirectionY
    if (myCenterX + myDirectionX > 0 && myCenterX + myDirectionX < width) {
      myCenterX += myDirectionX;
    }
    if (myCenterY + myDirectionY > 0 && myCenterY + myDirectionY < height) {
      myCenterY += myDirectionY;
  }

    //wrap around screen
    if(myCenterX >width)
    {
      myCenterX = 0;
    }
    else if (myCenterX<0)
    {
      myCenterX = width;
    }
    /*if(myCenterY >height)
    {
      myCenterY = 0;
    }*/

    else if (myCenterY < 0)
    {
      myCenterY = height;
    }
  }
  public void show ()  //Draws the floater at the current position
  {
    fill(myColor);
    stroke(myColor);

    //translate the (x,y) center of the ship to the correct position
    translate((float)myCenterX, (float)myCenterY);

    //convert degrees to radians for rotate()
    float dRadians = (float)(myPointDirection*(Math.PI/180));

    //rotate so that the polygon will be drawn in the correct direction
    rotate(dRadians);

    //draw the polygon
    beginShape();
    for (int nI = 0; nI < corners; nI++)
    {
      vertex(xCorners[nI], yCorners[nI]);
    }
    endShape(CLOSE);

    //"unrotate" and "untranslate" in reverse order
    rotate(-1*dRadians);
    translate(-1*(float)myCenterX, -1*(float)myCenterY);
  }
}
class Spaceship extends Floater	{
    public Spaceship() {
      int i = 1;
      corners = 16;
      xCorners = new int[corners];
      yCorners = new int[corners];
      int [] xCornersI = {25*i,20*i,12*i,8*i,-4*i,-2*i,-6*i,-8*i,-12*i,-8*i,-6*i,-2*i,-4*i,8*i,12*i,20*i};
      int [] yCornersI = {0*i,-2*i,-8*i,-8*i,-18*i,-6*i,-6*i,-2*i,0*i,2*i,6*i,6*i,18*i,8*i,8*i,2*i};
      xCorners = xCornersI;
      yCorners = yCornersI;

      myColor = 255;
    }

    public void setX(double x) {myCenterX = x;}
    public int getX() {return (int)myCenterX;}
    public void setY(double y) {myCenterY = y;}
    public int getY() {return (int)myCenterY;}
    public void setDirectionX(double x) {myDirectionX = x;}
    public double getDirectionX() {return (int)myDirectionX;}
    public void setDirectionY(double y) {myDirectionY = y;}
    public double getDirectionY() {return (int)myDirectionY;}
    public void setPointDirection(int degrees) {myPointDirection = degrees;}
    public double getPointDirection() {return myPointDirection;}

    public void accelerate()  {
      if (W == true) {myDirectionY=-speed;}
      if (A == true) {myDirectionX=-speed;}
      if (S ==true) {myDirectionY= speed;}
      if (D == true) {myDirectionX= speed;}
      if (W == false && S == false && myDirectionY != 0)  {
            if (myDirectionY > 0) {myDirectionY -= speed*0.05f;}
            if (myDirectionY < 0) {myDirectionY += speed*0.05f;}
            if (abs((float)myDirectionY) < speed*0.05f) {myDirectionY = 0;}
          }
      if (A == false && D == false && myDirectionX != 0)  {
            if (myDirectionX > 0) {myDirectionX -= speed*0.05f;}
            if (myDirectionX < 0) {myDirectionX += speed*0.05f;}
            if (abs((float)myDirectionX) < speed*0.05f) {myDirectionX = 0;}
          }
       if (Shift == true) {
       		speed = 10;
       		/*for (int i = 0; i < fuel; i++) {
       			fuel -= i;
       			if (fuel <= 0) {
       				Shift = false;
       			}
       		}*/
       	}
       else if (Shift == false) {speed = 5;}
      }

    public void turn()  {
      myPointDirection = (Math.atan2(mouseY - myCenterY,mouseX - myCenterX))/PI*180;
    }

    /*public void voidShift() {
    	if (voidShift == true) {

    	}
    }*/

    /*public void arsenal() {
    	if (WeaponSwap1 == true) {

    	}
    	if (WeaponSwap2 == true) {

    	}
    }*/
}
class Star {
  private float x,y;
  public Star() {
    x = random(width);
    y = random(2*height);
  }
  /*public void update() {
    y += starSpeed;
    if (y > height) {
      y = random(-2*height);
    }
    if (shift == true) {starSpeed = 10;}
    if (shift == false) {starSpeed = 2;}
  }*/
  public void show() {
    stroke(255);
    ellipse(x,y,1,1);
  }

}
  public void settings() { 	size(1080,720); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "AsteroidsGame" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
