class ProgressBAR {
	private float i;
	private boolean pro;
	private int x, y, r, g, b, size;

	public ProgressBAR(int setX, int setY) {
		x = setX;
		y = setY;
		i = 200;
	}

	public void colorFill(int r1, int g1, int b1) {
		r = r1;
		g = g1;
		b = b1;
	}

	public void setSize(int s) {
		size = s;
	}

	public void show() {
		fill(r, g, b);
    	noStroke();
		rect(x, y, i, size);
		noFill();
    	//stroke(255);
    	rect(x, y, 200, size);
	}

	public void decreaseI(float x) {
		i-=x;
	}

	public void increaseI(float x) {
		i+=x;
	}

	public float getI() {
		return i;
	}
}