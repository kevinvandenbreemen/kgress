import 'dart:ui';

abstract class ImageSet  {

  void drawNextFrame(Canvas canvas, Rect rect);

  void update(double timePassedSeconds);

}