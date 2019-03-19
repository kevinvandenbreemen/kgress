import 'package:flame/animation.dart';
import 'dart:ui';
import 'package:kevin_gamify/game/components/Direction.dart';
import 'package:flame/flame.dart';

/// The actual animations / images for drawing a [Character]
abstract class CharacterAnimations {

}

/// Animations for handling a character that can move around on the screen
class DirectionalCharacterAnimations {

  Map<Direction, Animation> _directionAnimations = {};


  DirectionalCharacterAnimations() {

    Animation downAnimation = Animation.sequenced('player_character.png',
      7,
      stepTime: 1,
      textureHeight: 40.0,
      textureWidth: 40.0,
      textureX: 140.0,
      textureY: 650.0
    );

    _directionAnimations[Direction.down] = downAnimation;
    _directionAnimations[Direction.up] = downAnimation;
    _directionAnimations[Direction.left] = downAnimation;
    _directionAnimations[Direction.right] = downAnimation;
    _directionAnimations[Direction.stationary] = downAnimation;
  }

  Direction _direction;

  Image nextFrame() {
    return _directionAnimations[_direction].getSprite().image;
  }

  void update(Direction directionToTarget, double timePassedSeconds) {
    _direction = directionToTarget;
    _directionAnimations[_direction].update(timePassedSeconds);
  }





}