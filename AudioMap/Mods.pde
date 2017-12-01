/////////MODS\\\\\\\\\

//These are the various variables that can be modified to change
//the look and feel of any visualizer

class Mods {
  
  //Positive numbers are more intense, negative are less.
  //0 is neutral
  int intensity;
  
  //Positive numbers are more angry, negative are more sad.
  //0 is upbeat
  int mood;
  
  
  Mods() {
    intensity = 0;
    mood = 0;
  }
  
  int getIntensity() {
    return intensity;
  }
  
  int getMood() {
    return mood;
  }
  
  int modifyIntensity(int amount) {
    intensity += amount;
    if (intensity > 5) {
      intensity = 5;
    }
    if (intensity < -5) {
      intensity = -5;
    }
    return intensity;
  }
  
  int modifyMood(int amount) {
    mood += amount;
    if (mood > 5) {
      mood = 5;
    }
    if (mood < -5) {
      mood = -5;
    }
    return mood;
  }
  
  void display() {
    pushStyle();
    colorMode(RGB);
    fill(20, 20, 20);
    noStroke();
    rect(0, height - 70, width, 70);
    fill(255, 255, 255);
    textSize(20);
    text("Intensity", 220, height - 50);
    text("Mood", 620, height - 50);
    colorMode(HSB);
    fill(80, 255, 255);
    rect(255, height - 40, 10, 30);
    int val = abs(intensity);
    int rectPos = 255;
    int colorPos = 80;
    for(int x = 0; x < val; x++) {
      if (val > intensity) {
        rectPos = rectPos - 10;
        colorPos = colorPos + 20;
      } else {
        rectPos = rectPos + 10;
        colorPos = colorPos - 20;
      }
      if (colorPos < 0) {
         colorPos = 0; 
      }
      if (colorPos > 200) {
        colorPos = 200;
      }
      fill(colorPos, 255, 255);
      rect(rectPos, height - 40, 10, 30);
    }
    
    fill(80, 255, 255);
    rect(645, height - 40, 10, 30);
    val = abs(mood);
    rectPos = 645;
    colorPos = 80;
    for(int x = 0; x < val; x++) {
      if (val > mood) {
        rectPos = rectPos - 10;
        colorPos = colorPos + 20;
      } else {
        rectPos = rectPos + 10;
        colorPos = colorPos - 20;
      }
      if (colorPos < 0) {
         colorPos = 0; 
      }
      if (colorPos > 200) {
        colorPos = 200;
      }
      fill(colorPos, 255, 255);
      rect(rectPos, height - 40, 10, 30);
    }
    
    colorMode(HSB);
    popStyle();
  }
}