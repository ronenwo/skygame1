//Using forces, simulate a helium-filled balloon floating upward and bouncing off the top of a window. 
//Can you add a wind force that changes over time, perhaps according to Perlin noise?
class Balloon {

  public static final float mwidth = 50;
  public static final float mheight = 74;
  
  public boolean enable = true;
  
  public PVector location;
  PVector velocity, acceleration;    

  Balloon(float _x) {
    location = new PVector(_x, 0);
    velocity = new PVector(0, 0.05f);
    acceleration = new PVector(0, 0);
  }

  Balloon(float _x, float _vx, float _vy) {
    location = new PVector(_x, 0);
    velocity = new PVector(_vx, _vy);
    acceleration = new PVector(0, 0);
  }


  public void display() {
    if (!enable){
       return; 
    }
    fill(255, 0, 0);
    smooth();
    noStroke();
    ellipse(location.x, location.y, mwidth, mheight);
//    fill(0);
//    triangle(location.x - 20,location.y,location.x,location.y,location.x + 20,location.y);    
  }
  
  public void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }

  public void applyForce(PVector force) {
    acceleration.add(force);
  }

  public void applyLeftForce(PVector force) {
//    force.mult((width-location.x)/width,1); 
//    acceleration.add(location.xforce);
  }

  public void applyRightForce(PVector force) {
    acceleration.add(force);
  }

  //when balloon hits the top of the sketch where x <= 0, have bounce back, otherwise if balloon leaves screen delete from the arraylist of balloons
  public boolean checkEdges() {
//    return false;
    if (location.y >= height) {
      return true;
    }    
    if (location.x >= (width -20)) {
      velocity.x *= -1.0f;      
      return false;
    }
    if (location.x <= 20) {
      velocity.x *= -1.0f;      
      return false;
    }
    return false;
  }
}

