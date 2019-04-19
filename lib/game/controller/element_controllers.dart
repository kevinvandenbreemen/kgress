import 'dart:math';
import 'dart:ui';

import 'package:kevin_gamify/game/components/Direction.dart';
import 'package:kevin_gamify/game/controller/area_context.dart';
import 'package:kevin_gamify/game/elements/element.dart';
import 'package:kevin_gamify/game/elements/element_types.dart';
import 'package:kevin_gamify/game/imagesets/element_drawers.dart';
import 'package:kevin_gamify/game/states/states.dart';
import 'package:logging/logging.dart';

abstract class ElementController {

  static Logger _default = Logger("ElementController");

  Logger _logger;

  Element _element;

  ElementDrawer _elementDrawer;

  ElementController(Element element, {ElementDrawerRepository elementDrawersRepo}){
    _element = element;
    _elementDrawer = elementDrawersRepo.getDrawer(_element);

    if(element.kind.elementType == playerCharacter) {
      _logger = Logger("Pl:[${element.kind.name}]@${element.layerNum}");
    } else {
      _logger = _default;
    }
  }

  double get xTile => _element.locXinTiles;
  double get yTile => _element.locYinTiles;
  int get layer => _element.layerNum;

  /// Update the element.  Returns the [Rect] corresponding to the element's
  /// current position in the game world, NOT necessarily its current position
  /// on the screen.
  Rect update(double timePassedSeconds, AreaContext context) {
    Rect ret = onUpdate(timePassedSeconds, _element, context);
    _elementDrawer.update(_element.state, timePassedSeconds);
    return ret;
  }

  Rect onUpdate(double timePassedSeconds, Element element, AreaContext context);

  /// Draw the element on the screen into the given rectangle
  void draw(Rect rect, Canvas canvas) {
    _elementDrawer.drawNextFrame(rect, canvas);
  }

  canMove(Direction direction, AreaContext context) {
    if(Directions.isHorizontal(direction)) {
      return (direction == Direction.left) ? (_element.locXinTiles > 0) : _element.locXinTiles < context.numTiles-1;
    } else if (Directions.isVertical(direction)) {
      return (direction == Direction.down) ? (_element.locYinTiles < context.numTiles -1) : _element.locYinTiles > 0;
    }

    return true;
  }

  collision(Direction direction, AreaContext context) {

    if(direction == Direction.stationary) {
      return false;
    }

    if(context.elements == null) {
      return false;
    }

    Iterable<Point<double>> nearbyObjects = context.elements.keys.where((point) {
      Element mappedTo = context.elements[point];
      if(mappedTo.layerNum != _element.layerNum){
        return false;
      }
      if(mappedTo != _element){
        return ((point.x - _element.locXinTiles).abs() < 1 && (point.y - _element.locYinTiles).abs() < 1);
      }
      return false;
    });

    Point<double> collidesWith;
    if(Directions.isHorizontal(direction)) {
      collidesWith =  nearbyObjects.firstWhere((point) {
        return direction == Direction.left ? point.x < _element.locXinTiles : point.x > _element.locXinTiles;
      }, orElse: ()=>null);
    }
    else {
      collidesWith = nearbyObjects.firstWhere((point) {
        return direction == Direction.up ? point.y < _element.locYinTiles : point.y > _element.locYinTiles;
      }, orElse: ()=>null);
    }

    if(collidesWith != null) {
      Element object = context.elements[collidesWith];
      _logger.fine("@(${_element.locXinTiles}, ${_element.locYinTiles}) - Collide w:${object.kind.name}@(${object.locXinTiles}, ${object.locYinTiles})@${object.layerNum}");
    }

    return collidesWith != null;
  }

}

class StationaryElementController extends ElementController {
  StationaryElementController(Element element, ElementDrawerRepository elementDrawersRepo) : super(element, elementDrawersRepo: elementDrawersRepo);

  @override
  Rect onUpdate(double timePassedSeconds, Element element, AreaContext context) {
    //  Nothing to do here
  }

}

class PlayerController extends ElementController {

  Direction _userDirection = Direction.stationary;

  /// Speed character moves
  /// TODO  Should this actually be a constant/setting somewhere???
  double _speed = 0.05;

  PlayerController(Element element, ElementDrawerRepository elementDrawersRepo) : super(element, elementDrawersRepo: elementDrawersRepo);

  void updateDirection(Direction direction) {
    _userDirection = direction;
  }

  @override
  Rect onUpdate(double timePassedSeconds, Element element, AreaContext context) {

    if(canMove(_userDirection, context) && !collision(_userDirection, context)) {
      //  Now we need to move!
      double delta = Directions.delta(d: _speed, direction: _userDirection);
      if (Directions.isHorizontal(_userDirection)) {
        element.locXinTiles += delta;
      } else if (Directions.isVertical(_userDirection)) {
        element.locYinTiles += delta;
      }
    }

    //  Update the element state based on direction
    element.state = fromDirection(_userDirection);
  }

}

/// Access to appropriate element controllers
mixin ElementControllerRepository {

  ElementController getController(Element element);

}