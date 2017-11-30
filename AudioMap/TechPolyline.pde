/////////TechPolyline\\\\\\\\\

import java.awt.Point;

class TechPolyline {
  
  Point[] points;
  int counter;
  
  TechPolyline() {
    int pointsLength = (int) random(900, 1100);
    points = new Point[pointsLength];
    counter = 0;
  }
  
  void add(Point p) {
    points[counter] = p;
    counter++;
    if (counter >= points.length - 1){
      Point[] tmp = new Point[points.length * 2];
      arrayCopy(points, tmp);
      points = tmp;
    }
  }
  
  int size() {
    return counter;
  }
  
  Point get(int i) {
    return points[i];
  }
  
  void set(int i, Point p) {
    points[i] = p;
  }
  
}