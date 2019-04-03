import 'dart:ui';

import 'package:kevin_gamify/game/states/states.dart';

/// Provides appropriate next im
abstract class StateImagesetProvider {

  /// Draw the next frame in the animation
  void drawNextFrame(Rect characterRect, Paint paint, Canvas canvas);

  /// Update the provider with the current state and with how much time has passed
  void update(State state, double timePassedSeconds);

}