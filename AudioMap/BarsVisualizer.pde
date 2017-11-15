/////////BarsVisualizer\\\\\\\\\

class BarsVisualizer implements IVisualizer {
  
  PShader blur;
  boolean blurOn;
  int bandCount;
  int colorRange = 1;
  int colorStart = 0;
  int fade = 100;
  
  
  BarsVisualizer(int bandCount) {
    this.bandCount = bandCount;
    blur = loadShader("blur.glsl");
    blurOn = false;
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
    } else if (m.intensity > 0) {
      blurOn = false;
      fade = 100;
    } else if (m.intensity < 0) {
      blurOn = true;
      fade = 20;
    }
  }
  
  void display() {
    //Create transparent fade bg
    pushStyle();
    fill(0, 10);
    rect(0, 0, width, height);
    popStyle();
    
    pushStyle();
    colorMode(HSB);
    noStroke();
    for(int i = 0; i < bandCount; i++) {
      fill(i / colorRange + colorStart, 255, spectrum[i] * 255 * colorstivity, fade);
      //rect( (width / bandCount) * i, height - spectrum[i]*height*stivity, width / bandCount, height - spectrum[i]*height*stivity);
      rect( (width / bandCount) * i, 0, width / bandCount, height);
    }
    if (blurOn) {
      filter(blur);
    }
    popStyle();
  }
  
  String type() {
    return "bars";
  }
  
  void reset() {
   //not needed for this vis 
  }
}