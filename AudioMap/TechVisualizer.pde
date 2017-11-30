/////////TechVisualizer\\\\\\\\\

import java.awt.Point;

class TechVisualizer implements IVisualizer {
  
  PShader blur;
  boolean blurOn;
  int bandCount;
  int colorRange = 1;
  int colorStart = 0;
  int fade = 100;
  int xVel = 0;
  int yVel = 1;
  boolean newDir;
  boolean changeDir;
  int bassSpeed;
  int trebSpeed;
  int turnSpeed;
  int counter;
  
  TechPolyline[] bars;
  
  TechVisualizer(int bandCount) {
    this.bandCount = bandCount;
    blur = loadShader("blur.glsl");
    blurOn = false;
    bars = new TechPolyline[bandCount];
    for (int i = 0; i < bandCount; i++) {
      bars[i] = new TechPolyline();
      bars[i].add(new Point(width / 2, height / 2));
      //(width / bandCount) * i
    }
    newDir = true;
    changeDir = false;
    bassSpeed = 100;
    trebSpeed = 200;
    counter = 0;
    
  }
  
  void update(float[] spectrum) {
    if (m.mood == 0) {
      colorRange = 1;
      colorStart = 0;
      bassSpeed = 75;
      trebSpeed = 200;
    } else if (m.mood > 0) {
      colorRange = m.mood + 2;
      colorStart = 0;
      bassSpeed = (m.mood + 1) * 100;
      trebSpeed = bassSpeed * 2;
    } else if (m.mood < 0) {
      colorRange = -(m.mood - 1);
      colorStart = 150;
      bassSpeed = 100 / (abs(m.mood) + 1);
      trebSpeed = bassSpeed * 2;
    }
    
    if (m.intensity == 0) {
      blurOn = false;
      fade = 50;
      turnSpeed = 60;
    } else if (m.intensity > 0) {
      blurOn = false;
      fade = 100;
      turnSpeed = 30;
    } else if (m.intensity < 0) {
      blurOn = true;
      fade = 20;
      turnSpeed = 120;
    }
    
    if (random(20, turnSpeed) < counter) {
      if (xVel == 0 && yVel == 1) {
        xVel = (int) random(-2, 0);
        if (xVel == 0) {
          xVel = 1;
        }
        yVel = 0;
      } else if (xVel == 1 && yVel == 0) {
        xVel = 0;
        yVel = (int) random(-2, 0);
        if (yVel == 0) {
          yVel = 1;
        }
      } else if (xVel == 0 && yVel == -1) {
        xVel = (int) random(-2, 0);
        if (xVel == 0) {
          xVel = 1;
        }
        yVel = 0;
      } else {
        xVel = 0;
        yVel = (int) random(-2, 0);
        if (yVel == 0) {
          yVel = 1;
        }
      }
      changeDir = false;
      newDir = true;
      counter = 0;
    }
    counter++;
    
    float spectValue;
    for (int i = 0; i < bandCount; i++) {
      if (bandCount / 5 > i) {
        spectValue = spectrum[i] * bassSpeed;
      } else {
        spectValue = spectrum[i] * trebSpeed;
      }
      if (spectValue > 30 && !newDir) {
        changeDir = true;
      }
      TechPolyline curBar = bars[i];
      Point last = curBar.get(curBar.size() - 1);
      if (newDir) {
        curBar.add(new Point(last.x, last.y));
      }
      curBar.set(curBar.size() - 1, new Point((int)(last.x + (spectValue * xVel)), (int)(last.y + (spectValue * yVel))));
      //curBar.add(new Point((int)(last.x + (spectValue * xVel)), (int)(last.y + (spectValue * yVel))));
    }
    if (newDir) {
      newDir = false;
    }
    
  }
  
  void display() {
    
    background(0);
    
    pushStyle();
    colorMode(HSB);
    strokeWeight(2);
    
    TechPolyline barList;
    Point p;
    Point lastP;
    float spectNum;
    for (int n = 0; n < bars.length; n++) {
      if ((bandCount / 5) > n) {
        spectNum = spectrum[n] / 2;
      } else {
        spectNum = spectrum[n] * 2;
      }
      stroke(n / colorRange + colorStart, 255, 255, spectNum * 255 * colorstivity);
      barList = bars[n];
      for (int i = 1; i < barList.size(); i++) {
        p = barList.get(i);
        lastP = barList.get(i-1);
        //stroke(255);
        line(lastP.x, lastP.y, p.x, p.y);
      }
    }
    if (blurOn) {
      filter(blur);
    }
    popStyle();
  }
  
  String type() {
   return "tech"; 
  }
  
  void reset() {
    bars = new TechPolyline[bandCount];
    for (int i = 0; i < bandCount; i++) {
      bars[i] = new TechPolyline();
      bars[i].add(new Point(width / 2, height / 2));
      //(width / bandCount) * i
    }
    newDir = true;
  }
  
}