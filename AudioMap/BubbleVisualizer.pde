/////////BubbleVisualizer\\\\\\\\\

class BubbleVisualizer implements IVisualizer {
  
  final float bubbleThreshold = 0.005;
  int bandCount;
  ArrayList<ArrayList<Bubble>> bubbleSystems;
  
  BubbleVisualizer(int bandCount) {
    this.bandCount = bandCount;
    bubbleSystems = new ArrayList<ArrayList<Bubble>>();
    for (int i = 0; i < bandCount; i++) {
      bubbleSystems.add(new ArrayList<Bubble>());
    }
  }
  
  void update(float[] spectrum) {
    for (int i = 0; i < bandCount; i++) {
      //println(spectrum[i]);
      if (spectrum[i] > bubbleThreshold) {
        bubbleSystems.get(i).add(
                new Bubble((width / bandCount) * i, 
                            height + 20, 20, 0, -5, -0.5, 
                            color(i, 255, spectrum[i] * 255 * colorstivity)));
      }
    }
  }
  
  void display() {
    //create background
    background(0);
    
    ArrayList<Bubble> bubList;
    for (int a = 0; a < bubbleSystems.size(); a++) {
      bubList = bubbleSystems.get(a);
      for (int b = 0; b < bubList.size(); b++) {
        Bubble bub = bubList.get(b);
        bub.update();
        bub.display();
        if (bub.y < 0 - bub.r) {
          bubList.remove(bub);
        } 
      }
    }
  }
}