/////////VisualizerFactory\\\\\\\\\

//This class has a two methods,
//makeVisualizre takes a string representing a visualizer type
//and returns a new visualizer of that type.

//next takes a visualizer and the number of bands, and returns the
//next type of visualizer. This allows a user to
//cyle through the various visualizers

class VisualizerFactory {
  
  
  VisualizerFactory() {
   
  }
  
  IVisualizer makeVisualizer(String type, int bandCount) {
    if (type.equals("bars")) {
      return new BarsVisualizer(bandCount);
    } else if (type.equals("tech")) {
      return new TechVisualizer(bandCount);
    } else if (type.equals("circle")) {
      return new CircleVisualizer(bandCount);
    }
    else {
      throw new IllegalArgumentException("Invalid Visualizer Type");
    }
  }
  
  IVisualizer next(IVisualizer v, int bandCount) {
    if (v.type().equals("bars")) {
      return new CircleVisualizer(bandCount);
    } else if (v.type().equals("circle")) {
      return new TechVisualizer(bandCount);
    } else {
      return new BarsVisualizer(bandCount);
    }
  }
  
  
}