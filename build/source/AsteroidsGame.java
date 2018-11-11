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
Asteroid[] rocks = new Asteroid[5];
boolean accel = false;
boolean rotateL = false;
boolean rotateR = false;

public void setup() {
	
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
  if (accel == true)A2.accelerate(.1f);
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

public void keyReleased() {
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
class Asteroid extends Floater {
  private int rotSpeed;
  public Asteroid() {
    corners = 4;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = 10;
    yCorners[0] = 0;
    xCorners[1] = 0;
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

    rotSpeed = ((int)Math.random()*20);

    myColor = 175;
  }

  public void setX(int x) {myCenterX = x;}
  public int getX() {return (int)myCenterX;}
  public void setY(int y) {myCenterY = y;}
  public int getY() {return (int)myCenterY;}
  public void setDirectionX(double x) {myDirectionX = x;}
  public double getDirectionX() {return (int)myDirectionX;}
  public void setDirectionY(double y) {myDirectionY = y;}
  public double getDirectionY() {return (int)myDirectionY;}
  public void setPointDirection(int degrees) {myPointDirection = degrees;}
  public double getPointDirection() {return myPointDirection;}

  public void move() {
    myPointDirection += rotSpeed;   
    super.move();
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
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
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
    double dRadians =myPointDirection*(Math.PI/180);     
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
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
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
class Spaceship extends Floater
{
    public Spaceship() {
    	corners = 5;
    	xCorners = new int[corners];
    	yCorners = new int[corners];
    	xCorners[0] = 25;
    	yCorners[0] = 0;
    	xCorners[1] = -3;
    	yCorners[1] = -15;
    	xCorners[2] = -16;
    	yCorners[2] = -6;
    	xCorners[3] = -16;
    	yCorners[3] = 6;
    	xCorners[4] = -3;
    	yCorners[4] = 15;

      myColor = 255;
    }

    public void setX(int x) {myCenterX = x;}
    public int getX() {return (int)myCenterX;}
    public void setY(int y) {myCenterY = y;}
    public int getY() {return (int)myCenterY;}
    public void setDirectionX(double x) {myDirectionX = x;}
    public double getDirectionX() {return (int)myDirectionX;}
    public void setDirectionY(double y) {myDirectionY = y;}
    public double getDirectionY() {return (int)myDirectionY;}
    public void setPointDirection(int degrees) {myPointDirection = degrees;}
    public double getPointDirection() {return myPointDirection;}
}
class Star {
  private double x,y;
  public Star() {
    x = Math.random()*width;
    y = Math.random()*height;
  }
  public void show() {
    stroke(255);
    point((float)x,(float)y);
  }

}
  public void settings() { 	size(800,800); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "AsteroidsGame" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
