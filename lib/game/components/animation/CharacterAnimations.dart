import 'dart:ui';

import 'package:flame/animation.dart';
import 'package:flame/sprite.dart';
import 'package:kevin_gamify/game/components/Direction.dart';

/// The actual animations / images for drawing a [Character]
abstract class CharacterAnimations {

  void drawNextFrame(Canvas canvas, Rect rect);

}

/// Animations for handling a character that can move around on the screen
class DirectionalCharacterAnimations extends CharacterAnimations {

  Map<Direction, Animation> _directionAnimations = {};

  double height = 64.0;
  double width = 64.0;

  DirectionalCharacterAnimations() {

    _directionAnimations[Direction.down] = _getCharacterAnimation(4, 9);
    _directionAnimations[Direction.up] = _getCharacterAnimation(10, 9);
    _directionAnimations[Direction.left] = _getCharacterAnimation(9, 9);
    _directionAnimations[Direction.right] = _getCharacterAnimation(11, 9);
    _directionAnimations[Direction.stationary] = _getCharacterAnimation(1, 7);
  }

  Direction _direction;

  Animation _getCharacterAnimation(int sheetRow, int numFrames) {
    return Animation.sequenced('player_character.png',
        numFrames,
        textureHeight: height,
        textureWidth: width,
        textureX: 0.0,
        textureY: sheetRow * height
    );
  }

  @override
  void drawNextFrame(Canvas canvas, Rect rect) {
    _directionAnimations[_direction].getSprite().renderRect(canvas, rect);
  }

  void update(Direction directionToTarget, double timePassedSeconds) {
    _direction = directionToTarget;
    _directionAnimations[_direction].update(timePassedSeconds);
  }





}