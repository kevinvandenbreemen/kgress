import 'package:kevin_gamify/game/components/MotionController.dart';
import 'package:kevin_gamify/game/components/Character.dart';
import 'dart:ui';
import 'package:kevin_gamify/game/components/Direction.dart';
import 'package:kevin_gamify/game/components/animation/CharacterAnimations.dart';

/// Causes the character to go back and forth a specified distance from its starting position (wherever
/// that is)
class BackAndForthController extends MotionController {

  double _speed;

  Rect _target;

  /// Desired direction to target
  Direction _directionToTarget;

  DirectionalCharacterAnimations _animations;

  double _distance;

  BackAndForthController(Character character, double speed, this._distance) : super(character) {
    _speed = speed;
    _target = character.position.shift(Offset(_distance, 0));
    _directionToTarget = Directions.of(from: character.position, to: _target);
    _animations = DirectionalCharacterAnimations();
  }

  @override
  Rect update(double timePassedSeconds) {
    Offset nextStep = Offset(Directions.delta(d: _speed, direction: _directionToTarget), 0);

    Rect ret = character.position.shift(nextStep);
    Direction latestDirection = Directions.of(from: ret, to: _target);
    if(latestDirection == Directions.opposite(of: _directionToTarget)) {
      _directionToTarget = latestDirection;
      _target = character.position.shift(Offset(Directions.delta(d: _distance, direction: _directionToTarget), 0));
    }

    _animations.update(_directionToTarget, timePassedSeconds);

    return ret;
  }

  @override
  void draw(Rect characterRect, Paint paint, Canvas canvas) {
    _animations.drawNextFrame(canvas, characterRect);
  }


}