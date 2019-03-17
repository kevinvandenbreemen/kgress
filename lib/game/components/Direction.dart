import 'dart:ui';
import 'dart:core';

enum Direction {
  up,
  down,
  left,
  right,
  stationary
}

class Directions {

  static Direction of({from: Rect, to: Rect}) {

    double deltaX = (from.left - to.left).abs();
    double deltaY = (from.top - to.top).abs();

    if(deltaX - deltaY > 0) {         //  The x-component is larger than the y-component of the difference between points
      if(from.left > to.left) {
        return Direction.left;
      }
      if(from.left < to.left) {
        return Direction.right;
      }
    } else if (deltaX - deltaY < 0) { //  The y-component is larger than the x-component of the differences between points
      if(from.top < to.top) {
        return Direction.up;
      }
      if(from.top > to.top) {
        return Direction.down;
      }
    }

    return Direction.stationary;
  }

}