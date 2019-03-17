import 'dart:ui';

enum Direction {
  up,
  down,
  left,
  right
}

class Directions {

  static Direction of({from: Rect, to: Rect}) {

    if(from.left > to.left) {
      return Direction.left;
    }
    if(from.left < to.left) {
      return Direction.right;
    }
    if(from.top < to.top) {
      return Direction.up;
    }
    if(from.top > to.top) {
      return Direction.down;
    }

    return null;
  }

}