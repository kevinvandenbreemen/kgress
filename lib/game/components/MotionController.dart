import 'Character.dart';
import 'dart:ui';

/// Logic for handling the motion/where to put a [Character]
abstract class MotionController {

  final Character character;

  MotionController(this.character);

  /// Implement logic for updating the position etc of the character
  Rect update(double timePassedSeconds);

  /// Draw an image for the character
  void draw(Rect characterRect, Paint paint, Canvas canvas);
}