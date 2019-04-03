import 'dart:ui';

import 'package:kevin_gamify/game/elements/element.dart';

abstract class ElementController {

  Element _element;

  /// Update the element.  Returns the [Rect] corresponding to the element's
  /// current position in the game world, NOT necessarily its current position
  /// on the screen.
  Rect update(double timePassedSeconds) {
    return onUpdate(timePassedSeconds, _element);
  }

  Rect onUpdate(double timePassedSeconds, Element element);

  /// Draw the element on the screen into the given rectangle
  void draw(Rect rect, Paint paint, Canvas canvas);

}