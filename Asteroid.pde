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
    super.move();
  }

}
