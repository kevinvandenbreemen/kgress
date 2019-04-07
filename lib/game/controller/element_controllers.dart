import 'dart:ui';

import 'package:kevin_gamify/game/components/Direction.dart';
import 'package:kevin_gamify/game/elements/element.dart';
import 'package:kevin_gamify/game/imagesets/element_drawers.dart';
import 'package:kevin_gamify/game/states/states.dart';

abstract class ElementController {

  Element _element;

  ElementDrawer _elementDrawer;

  ElementController(Element element, {ElementDrawerRepository elementDrawersRepo}){
    _element = element;
    _elementDrawer = elementDrawersRepo.getDrawer(_element);
  }

  double get xTile => _element.locXinTiles;
  double get yTile => _element.locYinTiles;

  /// Update the element.  Returns the [Rect] corresponding to the element's
  /// current position in the game world, NOT necessarily its current position
  /// on the screen.
  Rect update(double timePassedSeconds) {
    Rect ret = onUpdate(timePassedSeconds, _element);
    _elementDrawer.update(_element.state, timePassedSeconds);
    return ret;
  }

  Rect onUpdate(double timePassedSeconds, Element element);

  /// Draw the element on the screen into the given rectangle
  void draw(Rect rect, Canvas canvas) {
    _elementDrawer.drawNextFrame(rect, canvas);
  }

}

class StationaryElementController extends ElementController {
  StationaryElementController(Element element, ElementDrawerRepository elementDrawersRepo) : super(element, elementDrawersRepo: elementDrawersRepo);

  @override
  Rect onUpdate(double timePassedSeconds, Element element) {
    //  Nothing to do here
  }

}

class PlayerController extends ElementController {

  Direction _userDirection = Direction.stationary;

  /// Speed character moves
  /// TODO  Should this actually be a constant/setting somewhere???
  double _speed = 1.0;

  PlayerController(Element element, ElementDrawerRepository elementDrawersRepo) : super(element, elementDrawersRepo: elementDrawersRepo);

  void updateDirection(Direction direction) {
    _userDirection = direction;
  }

  @override
  Rect onUpdate(double timePassedSeconds, Element element) {

    //  Now we need to move!
    double delta = Directions.delta(d: _speed, direction: _userDirection);
    if(Directions.isHorizontal(_userDirection)) {
      element.locXinTiles += delta;
    } else if (Directions.isVertical(_userDirection)){
      element.locYinTiles += delta;
    }

    //  Update the element state based on direction
    element.state = fromDirection(_userDirection);
  }

}

/// Access to appropriate element controllers
mixin ElementControllerRepository {

  ElementController getController(Element element);

}