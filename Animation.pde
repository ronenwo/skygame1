class Animation {
  PGraphics layer;
  PImage[] images;
  int imageCount;
  int frame;
  int tick;
  float targetX, targetY;
  public PVector location, dim;
  PVector velocity, acceleration;  

  public boolean enable = true;
  
  Animation(PGraphics layer, String imagePrefix, int count, 
    float x, float y, 
    float vx, float vy,
    float w, float h) {
    this.layer = layer;
    imageCount = count;
    images = new PImage[imageCount];
    dim = new PVector(w,h);

     location = new PVector(x,y);
     velocity = new PVector(vx,vy);
     acceleration = new PVector(0.0,0.0);

    for (int i = 1; i <= imageCount; i++) {
      // Use nf() to number format 'i' into four digits
      String filename = imagePrefix + i + ".png";
      images[i-1] = loadImage(filename);
//      images[i-1].resize(200,200);
      println("image loaded="+filename);
    }
  }
  
  
  
  void update(float tx, float ty){
    targetX = tx; 
    targetY = ty;
  }

  public void update() {
    if (!enable){
       return; 
    }
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    if (location.y >= height){
       reset();  
    }
  }

  public void updateReset(){
     reset(); 
  }
  
  public void updateLocation(float x, float y){
     location.set(x,y); 
  }


  void reset(){
    location.y =0;
  }

  int getFrameCount(){
//      int frameRatio = Math.round(frameCount / imageCount);
      int count = frameCount % Math.round(frameRate);
      count = Math.round(count / imageCount) + 1;
      count = count % imageCount;
      return count;
  }

  float getX(){
     return location.x;  
  }
  
  float getY(){
     return location.y;  
  }


  boolean display() {
    if (!enable){
       return false; 
    }
    frame = getFrameCount() ;
    if (dim.x == 0 || dim.y == 0){
      layer.image(images[frame], location.x, location.y);
    }
    else{
      layer.image(images[frame], location.x, location.y, dim.x, dim.y);
    }  
    if (frame == imageCount - 1){
       return true; 
    }
    else{
       return false; 
    }
  }

  
  
  int getWidth() {
    return images[0].width;
  }
}
