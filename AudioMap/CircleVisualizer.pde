/////////CircleVisualizer\\\\\\\\\

class CircleVisualizer implements IVisualizer {
  
  PShader blur;
  boolean blurOn;
  int bandCount;
  int colorRange = 1;
  int colorStart = 0;
  int fade = 100;
  int cx;
  int cy;
  int r;
  int size;
  int fadeLine = 200;
  
  
  CircleVisualizer(int bandCount) {
    this.bandCount = bandCount;
    blur = loadShader("blur.glsl");
    blurOn = false;
    cx = width / 2;
    cy = height / 2;
    r = height / 10;
    size = height / 3;
  }
  
  void update(float[] spectrum) {
    if (m.mood == 0) {
      colorRange = 1;
      colorStart = 0;
    } else if (m.mood > 0) {
      colorRange = m.mood + 2;
      colorStart = 0;
    } else if (m.mood < 0) {
      colorRange = -(m.mood - 1);
      colorStart = 150;
    }
    
    if (m.intensity == 0) {
      blurOn = false;
      fade = 50;
      fadeLine = 200;
    } else if (m.intensity > 0) {
      blurOn = false;
      fade = 150 * m.intensity;
      fadeLine = 255;
    } else if (m.intensity < 0) {
      blurOn = true;
      fade = 10;
      fadeLine = 255 / -(m.intensity * 2);
    }
  }
  
  void display() {
    //Create transparent fade bg
    pushStyle();
    fill(0, fade);
    rect(0, 0, width, height);
    popStyle();
    
    pushStyle();
    colorMode(HSB);
    noStroke();
    for(int i = 0; i < bandCount; i++) {
      pushMatrix();
      fill(i / colorRange + colorStart, 255, 255, fadeLine);
      translate(width / 2, height / 2);
      rotate(((2 * PI) / bandCount) * i);
      translate(0, r);
      rect( 0, 0, 2 * PI * r / bandCount, spectrum[i] * size * stivity);
      popMatrix();
    }
    if (blurOn) {
      filter(blur);
    }
    popStyle();
  }
  
  String type() {
     return "circle"; 
  }
  
  void reset() {
    //not needed for this vis
  }
  
}