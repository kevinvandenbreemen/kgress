import 'dart:ui';

import 'package:flame/animation.dart';
import 'package:flame/sprite.dart';
import 'package:kgress/game/elements/element.dart';
import 'package:kgress/game/imagesets/image_set.dart';
import 'package:kgress/game/states/states.dart';

/// Repository for providing drawers for elements
mixin ElementDrawerRepository {

  ElementDrawer getDrawer(Element element);

}

/// Provides appropriate next image and draws it when needed
abstract class ElementDrawer {

  /// Draw the next frame in the animation
  void drawNextFrame(Rect characterRect, Canvas canvas);

  /// Update the provider with the current state and with how much time has passed
  void update(State state, double timePassedSeconds);

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

class StatefulAnimatedImageElementDrawer extends ElementDrawer {

  Map<State, Animation> statesToAnimations;

  State currentState;

  StatefulAnimatedImageElementDrawer({Map<State, ImageSet> statesToImageSets}){
    if(statesToImageSets == null || statesToImageSets.isEmpty){
      throw ArgumentError.notNull("statesToImageSets");
    }

    this.statesToAnimations = Map();
    statesToImageSets.entries.forEach((entry){
      if(!(entry.value is SpriteSheetRowSequence)){
        throw ArgumentError("Image sets of type ${entry.value.runtimeType} are not supported");
      }

      SpriteSheetRowSequence sequence = entry.value;

      statesToAnimations[entry.key] = Animation.sequenced(sequence.imagePath,
        sequence.numFrames,
        textureHeight: sequence.textureHeight,
        textureWidth: sequence.textureWidth,
        textureX: sequence.textureX,
        textureY: sequence.sheetRow * sequence.textureHeight
      );

    });
  }

  @override
  void drawNextFrame(Rect characterRect, Canvas canvas) {
    statesToAnimations[currentState].getSprite().renderRect(canvas, characterRect);
  }

  @override
  void update(State state, double timePassedSeconds) {
    currentState = state;
    statesToAnimations[currentState].update(timePassedSeconds);
  }

}