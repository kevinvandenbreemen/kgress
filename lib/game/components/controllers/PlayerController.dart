import 'package:kevin_gamify/game/components/Character.dart';
import 'package:kevin_gamify/game/components/MotionController.dart';
import 'dart:ui';
import 'package:kevin_gamify/game/components/Direction.dart';
import 'package:kevin_gamify/game/components/animation/CharacterAnimations.dart';

/// Allows for player to control a character on the screen
class PlayerController extends MotionController {

  /// Speed the character moves when in motion
  double _speed;

  Direction _direction;

  DirectionalCharacterAnimations _animations;

  PlayerController({Character character, double speed}) : super(character){
    this._speed = speed;
    this._direction = Direction.stationary;
    this._animations = DirectionalCharacterAnimations(imagePath: 'player_character.png');
  }

  void setDirection(Direction direction) {
    this._direction = direction;
  }

  @override
  void draw(Rect characterRect, Paint paint, Canvas canvas) {
    _animations.drawNextFrame(canvas, characterRect);
  }

  @override
  Rect update(double timePassedSeconds) {

    Offset nextStep;
    Rect ret = character.position;

    if(Directions.isHorizontal(_direction)) {
      nextStep = Offset(Directions.delta(d: _speed, direction: _direction), 0);
    } else if (Directions.isVertical(_direction)){
      nextStep = Offset(0, Directions.delta(d: _speed, direction: _direction));
    }

    if(nextStep != null) {
      ret = character.position.shift(nextStep);
    }

    _animations.update(_direction, timePassedSeconds);

    return ret;

  }


}