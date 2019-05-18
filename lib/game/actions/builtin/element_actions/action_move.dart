import 'package:kevin_gamify/game/components/Direction.dart';
import 'package:kevin_gamify/game/elements/element.dart';

import 'element_action.dart';

class Move extends ElementAction {

  double speed = 0.05;

  Direction _direction;

  double _startingValue;

  int _distance;

  Move(this._direction, this._distance);

  @override
  bool isComplete() {
    if (Directions.isHorizontal(_direction)) {
      return (element.locXinTiles - _startingValue).abs() >= _distance;
    } else if (Directions.isVertical(_direction)) {
      return (element.locYinTiles - _startingValue).abs() >= _distance;
    }
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

  @override
  void onUpdateElement(Element element) {
    if (Directions.isHorizontal(_direction)) {
      _startingValue = element.locXinTiles;
    } else if (Directions.isVertical(_direction)) {
      _startingValue = element.locYinTiles;
    }
  }

  @override
  void onReset() {
    _startingValue = null;
  }


}