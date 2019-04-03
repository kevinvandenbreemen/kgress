import 'dart:ui';

import 'package:kevin_gamify/game/elements/element.dart';
import 'package:kevin_gamify/game/imagesets/state_image_set_providers.dart';

abstract class ElementController {

  Element _element;

  StateImagesetProvider _imageSetProvider;

  /// Update the element.  Returns the [Rect] corresponding to the element's
  /// current position in the game world, NOT necessarily its current position
  /// on the screen.
  Rect update(double timePassedSeconds) {
    Rect ret = onUpdate(timePassedSeconds, _element);
    _imageSetProvider.update(_element.state, timePassedSeconds);
    return ret;
  }

  Rect onUpdate(double timePassedSeconds, Element element);

  /// Draw the element on the screen into the given rectangle
  void draw(Rect rect, Paint paint, Canvas canvas) {
    _imageSetProvider.drawNextFrame(rect, paint, canvas);
  }

}