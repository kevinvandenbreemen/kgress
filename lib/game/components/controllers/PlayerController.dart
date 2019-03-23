import 'package:kevin_gamify/game/components/Character.dart';
import 'package:kevin_gamify/game/components/MotionController.dart';
import 'dart:ui';

/// Allows for player to control a character on the screen
class PlayerController extends MotionController {

  PlayerController({Character character}) : super(character){

  }

  @override
  void draw(Rect characterRect, Paint paint, Canvas canvas) {

  }

  @override
  Rect update(double timePassedSeconds) {

  }


}