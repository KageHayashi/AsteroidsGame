class Bullet extends Floater {
	public Bullet(Spaceship ship) {
		myCenterX = ship.getX();
		myCenterY = ship.getY();
		myPointDirection = ship.getPointDirection();
		double dRadians = myPointDirection*(Math.PI/180);
		myDirectionX = 5*Math.cos(dRadians);
		myDirectionY = 5*Math.sin(dRadians);
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
    	ellipse((float)myCenterX, (float)myCenterY, 5, 5);
    }
}