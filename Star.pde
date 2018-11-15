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
