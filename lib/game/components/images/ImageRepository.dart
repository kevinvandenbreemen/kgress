import 'package:flame/flame.dart';
import 'dart:ui';

class ImageRepository {

  Image upArrow() {
    return Flame.images.loadedFiles['arrow_up.png'];
  }

  Image downArrow() {
    return Flame.images.loadedFiles['arrow_down.png'];
  }

  Image rightArrow() {
    return Flame.images.loadedFiles['arrow_right.png'];
  }

  Image leftArrow() {
    return Flame.images.loadedFiles['arrow_left.png'];
  }


}