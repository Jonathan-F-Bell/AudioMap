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
    return intensity;
  }
  
  int modifyMood(int amount) {
    mood += amount;
    return mood;
  }
}