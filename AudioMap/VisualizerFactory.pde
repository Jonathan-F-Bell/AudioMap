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
      return new BubbleVisualizer(bandCount);
    } else if (type.equals("circle")) {
      return new CircleVisualizer(bandCount);
    }
    else {
      throw new IllegalArgumentException("Invalid Visualizer Type");
    }
  }
  
  IVisualizer next(IVisualizer v, int bandCount) {
    if (v.type().equals("bars")) {
      return new BubbleVisualizer(bandCount);
    } else if (v.type().equals("bubbles")) {
      return new CircleVisualizer(bandCount);
    } else if (v.type().equals("circle")) {
      return new TechVisualizer(bandCount);
    } else {
      return new BarsVisualizer(bandCount);
    }
  }
  
  
}