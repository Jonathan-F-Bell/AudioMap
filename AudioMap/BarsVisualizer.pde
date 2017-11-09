/////////BarsVisualizer\\\\\\\\\

class BarsVisualizer implements IVisualizer {
  
  int bandCount;
  
  BarsVisualizer(int bandCount) {
    this.bandCount = bandCount;
  }
  
  void update(float[] spectrum) {
    //This visualizer does not need to update, 
    //it has no element array and it displays directly from spectrum
  }
  
  void display() {
    //Create transparent fade bg
    pushStyle();
    fill(0, 10);
    rect(0, 0, width, height);
    popStyle();
    
    for(int i = 0; i < bandCount; i++) {
      pushStyle();
      colorMode(HSB);
      noStroke();
      fill(i, 255, spectrum[i] * 255 * colorstivity, 50);
      //rect( (width / bandCount) * i, height - spectrum[i]*height*stivity, width / bandCount, height - spectrum[i]*height*stivity);
      rect( (width / bandCount) * i, 0, width / bandCount, height);
      popStyle();
    }
  }
}