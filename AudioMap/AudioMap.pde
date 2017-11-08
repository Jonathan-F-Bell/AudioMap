
/*************************\
|  ARTG 2260_F2017_03     |
|  Jonathan Bell          |
|  bell.jo@husky.neu.edu  |
|  final_project          |
\*************************/

/////////AUDIOMAP\\\\\\\\\

import processing.sound.*;

FFT fft;
AudioIn in;
int bands = 512;
int bandCount = 20;
int stivity = 20;
float[] spectrum = new float[bands];

void setup() {
  size(900, 800);
  background(0);
  
  fft = new FFT(this, bands);
  in = new AudioIn(this, 0);
  
  in.start();
  
  fft.input(in);
}

void draw() {
  //background(0);
  pushStyle();
  fill(0, 10);
  rect(0, 0, width, height);
  popStyle();
  fft.analyze(spectrum);
  
  for(int i = 0; i < bandCount; i++) {
    pushStyle();
    stroke(255);
    rect( (width / bandCount) * i, height - spectrum[i * 2]*height*stivity, width / bandCount, height - spectrum[i]*height*stivity);
    popStyle();
  }
}