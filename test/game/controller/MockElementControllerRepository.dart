import 'dart:ui';

import 'package:kevin_gamify/game/controller/element_controllers.dart';
import 'package:kevin_gamify/game/elements/element.dart';

class MockElementController extends ElementController {
  @override
  Rect onUpdate(double timePassedSeconds, Element element) {
    // TODO: implement onUpdate
    return null;
  }

}

class MockElementControllerRepository with ElementControllerRepository{

  @override
  ElementController getController(Element element) {
    MockElementController();
  }



}