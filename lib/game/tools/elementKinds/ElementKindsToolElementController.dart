import 'dart:ui';

import 'package:kevin_gamify/game/controller/area_context.dart';
import 'package:kevin_gamify/game/controller/element_controllers.dart';
import 'package:kevin_gamify/game/elements/element.dart';
import 'package:kevin_gamify/game/imagesets/element_drawers.dart';
import 'package:kevin_gamify/game/states/states.dart';

class ElementKindsToolElementController extends ElementController {

  /// State that the user wants to try simulating
  State _state;

  ElementKindsToolElementController(Element element, ElementDrawerRepository elementDrawersRepo) : super(element, elementDrawersRepo: elementDrawersRepo);

  void setState(State state) {
    _state = state;
  }

  @override
  Rect onUpdate(double timePassedSeconds, Element element,
      AreaContext context) {
    element.state = _state;
  }


}