/////////Interface for types of Visualizers\\\\\\\\\

interface IVisualizer {
  
  //Updates the visualizer based on a given spectrumArray
  void update(float[] spectrum);
  
  //Displays the visualizer elements
  void display();
  
  //Returns a string denoting the type of visualizer this is.
  String type();
  
  //resets the visualizer
  void reset();
}