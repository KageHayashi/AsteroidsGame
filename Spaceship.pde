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
