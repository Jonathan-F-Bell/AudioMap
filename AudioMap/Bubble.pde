/////////Bubble\\\\\\\\\

//The Bubble class for BubbleVisualizer
class Bubble {
  
  float x, y;
  float r;
  float velX, velY;
  float accel;
  color c;
  
  Bubble(float x, float y, float r, float velX, float velY, float accel, color c) {
    this.x = x;
    this.y = y;
    this.r = r;
    this.velX = velX;
    this.velY = velY;
    this.accel = accel;
    this.c = c;
  }
  
  void update() {
    x += velX;
    y += velY;
    //velX += accel;
    velY += accel;
    c = color(hue(c), saturation(c), brightness(c), alpha(c) - (height / 255));
    
  }
  
  void display() {
    pushStyle();
    colorMode(HSB);
    noStroke();
    fill(c);
    ellipse(x, y, r, r);
    popStyle();
  }
}