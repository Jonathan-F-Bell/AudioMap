/////////VisualizerFactory\\\\\\\\\

//This class has a single method,
//it takes a string representing a visualizer type
//and returns a new visualizer of that type.

class VisualizerFactory {
  
  
  VisualizerFactory() {
   
  }
  
  IVisualizer makeVisualizer(String type, int bandCount) {
    if (type.equals("bars")) {
      return new BarsVisualizer(bandCount);
    } else if (type.equals("bubbles")) {
      println("made bubVisualizer");
      return new BubbleVisualizer(bandCount);
    }
    else {
      throw new IllegalArgumentException("Invalid Visualizer Type");
    }
  }
  
  
}