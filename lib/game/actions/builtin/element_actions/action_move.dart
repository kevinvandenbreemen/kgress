import 'package:kevin_gamify/game/components/Direction.dart';

import 'element_action.dart';

class Move extends ElementAction {

  double speed = 0.05;

  Direction _direction;
  int _distance;

  Move(this._direction, this._distance);

  @override
  bool isComplete() {

  }

  @override
  void act() {
    double delta = Directions.delta(d: speed, direction: _direction);
    if (Directions.isHorizontal(_direction)) {
      element.locXinTiles += delta;
    } else if (Directions.isVertical(_direction)) {
      element.locYinTiles += delta;
    }
  }
}