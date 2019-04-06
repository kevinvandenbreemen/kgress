import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:kevin_gamify/game/elements/element.dart';
import 'package:kevin_gamify/game/imagesets/image_set.dart';
import 'package:kevin_gamify/game/states/states.dart';

/// Provides appropriate next image and draws it when needed
abstract class ElementDrawer {

  /// Draw the next frame in the animation
  void drawNextFrame(Rect characterRect, Canvas canvas);

  /// Update the provider with the current state and with how much time has passed
  void update(State state, double timePassedSeconds);

}

mixin ElementDrawerRepository {

  ElementDrawer getDrawer(Element element);

}

class SingleImageElementDrawer extends ElementDrawer {

  Sprite _sprite;

  SingleImageElementDrawer(SingleImage singleImage) {
    _initSprites(singleImage.imagePath);
  }

  _initSprites(String imagePath) {
    _sprite = Sprite(imagePath);
  }

  @override
  void drawNextFrame(Rect characterRect, Canvas canvas) {
    _sprite.renderRect(canvas, characterRect);
  }

  @override
  void update(State state, double timePassedSeconds) {

  }



}