import 'dart:ui';

import 'package:kevin_gamify/game/elements/element.dart';
import 'package:kevin_gamify/game/states/states.dart';

/// Provides appropriate next im
abstract class ElementDrawer {

  /// Draw the next frame in the animation
  void drawNextFrame(Rect characterRect, Paint paint, Canvas canvas);

  /// Update the provider with the current state and with how much time has passed
  void update(State state, double timePassedSeconds);

}

mixin ElementDrawerRepository {

  ElementDrawer getDrawer(Element element);

}

class DefaultElementDrawerRepository with ElementDrawerRepository {
  @override
  ElementDrawer getDrawer(Element element) {
    throw Exception("Not yet implemented - Please implement 'stationary element drawer' and return!");
  }

}