import 'package:kgress/game/components/Direction.dart';
import 'package:kgress/game/elements/element.dart';
import 'package:kgress/game/states/states.dart';

import '../../action.dart';
import 'element_action.dart';

class Move extends ElementAction {

  double speed = 0.05;

  Direction _direction;

  double _startingValue;

  int _distance;

  Move(this._direction, this._distance);

  @override
  String toString() {
    return "Move $_direction at speed: $speed, dist: $_distance";
  }

  @override
  Action copy() {
    return Move(_direction, _distance);
  }

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

    //  Update element state
    element.state = fromDirection(_direction);
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