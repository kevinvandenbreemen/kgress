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

  DirectionalCharacterAnimations({String imagePath}) {

    _directionAnimations[Direction.down] = _getCharacterAnimation(imagePath, 4, 9);
    _directionAnimations[Direction.up] = _getCharacterAnimation(imagePath, 10, 9);
    _directionAnimations[Direction.left] = _getCharacterAnimation(imagePath, 9, 9);
    _directionAnimations[Direction.right] = _getCharacterAnimation(imagePath, 11, 9);
    _directionAnimations[Direction.stationary] = _getCharacterAnimation(imagePath, 1, 7);
  }

  Direction _direction;

  Animation _getCharacterAnimation(String imagePath, int sheetRow, int numFrames) {
    return Animation.sequenced(imagePath,
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