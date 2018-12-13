class Asteroid extends Floater {
  private int rotSpeed;
  public Asteroid() {
    int i = 2;
    corners = 4;
    xCorners = new int[corners];
    yCorners = new int[corners];
    int [] xCornersI = {10*i,1*i,-10*i,-10*i};
    int [] yCornersI = {1*i,-10*i,-10*i,10*i};
    xCorners = xCornersI;
    yCorners = yCornersI;

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
