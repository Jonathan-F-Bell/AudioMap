/////////Interface for types of Visualizers\\\\\\\\\

interface IVisualizer {
  
  //Updates the visualizer based on a given spectrumArray
  void update(float[] spectrum);
  
  //Displays the visualizer elements
  void display();
}