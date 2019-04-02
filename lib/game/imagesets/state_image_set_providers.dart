import 'dart:ui';

/// Provides appropriate next im
abstract class StateImagesetProvider {

  void drawNextFrame(Rect characterRect, Paint paint, Canvas canvas);

  void update(double timePassedSeconds);

}