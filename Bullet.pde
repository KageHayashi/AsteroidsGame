class Bullet extends Floater {
	private float d,d1;
	private double dRadians;
	public Bullet(Spaceship ship) {
		myCenterX = ship.getX();
		myCenterY = ship.getY();
		myPointDirection = (Math.atan2(mouseY - myCenterY,mouseX - myCenterX))/PI*180;
		dRadians = myPointDirection*(Math.PI/180);
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


		public void accelerate() {
			 myDirectionX = (speed*4 * Math.cos(dRadians));
			 myDirectionY = (speed*4 * Math.sin(dRadians));
		 }

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
