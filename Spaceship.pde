class Spaceship extends Floater	{
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
            if (myDirectionY > 0) {myDirectionY -= speed*0.05;}
            if (myDirectionY < 0) {myDirectionY += speed*0.05;}
            if (abs((float)myDirectionY) < speed*0.05) {myDirectionY = 0;}
          }
      if (A == false && D == false && myDirectionX != 0)  {
            if (myDirectionX > 0) {myDirectionX -= speed*0.05;}
            if (myDirectionX < 0) {myDirectionX += speed*0.05;}
            if (abs((float)myDirectionX) < speed*0.05) {myDirectionX = 0;}
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
