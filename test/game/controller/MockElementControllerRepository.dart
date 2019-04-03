import 'dart:ui';

import 'package:kevin_gamify/game/controller/element_controllers.dart';
import 'package:kevin_gamify/game/elements/element.dart';

class MockElementController extends ElementController {

  int _updateCount = 0;

  int get updateCallCount => _updateCount;

  @override
  Rect onUpdate(double timePassedSeconds, Element element) {
    _updateCount ++;
  }

}

class MockElementControllerRepository with ElementControllerRepository{

  List<MockElementController> controllers = List();

  @override
  ElementController getController(Element element) {
    ElementController ret = MockElementController();
    controllers.add(ret);
    return ret;
  }



}