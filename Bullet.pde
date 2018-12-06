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

    	if (WeaponSwap1 == true) {d = 20;}
    	if (WeaponSwap2 == true) {d = 50;d1 = 50;}
    }
}