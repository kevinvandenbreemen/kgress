import 'package:kevin_gamify/game/components/MotionController.dart';
import 'package:kevin_gamify/game/components/Character.dart';
import 'dart:ui';

/// Causes the character to go back and forth a specified distance from its starting position (wherever
/// that is)
class BackAndForthController extends MotionController {

  double _speed;

  Offset _target;

  double _distance;

  BackAndForthController(Character character, double speed, this._distance) : super(character) {
    _speed = speed;

    double x = character.position.left;
    double y = character.position.top;
    _target = Offset(x+_distance, y);
  }

  @override
  Rect update(double timePassedSeconds) {
    Offset nextStep = Offset(_speed, 0);

    return character.position.shift(nextStep);


  }


}