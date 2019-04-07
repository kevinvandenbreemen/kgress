import 'dart:math';
import 'dart:ui';

import 'package:kevin_gamify/game/areas/model/Area.dart';
import 'package:kevin_gamify/game/cartridge/GameCartridge.dart';
import 'package:kevin_gamify/game/components/Direction.dart';
import 'package:kevin_gamify/game/controller/area_context.dart';
import 'package:kevin_gamify/game/controller/element_controllers.dart';

class AreaController {

  /// Player controls (if applicable)
  PlayerController _playerController;

  List<ElementController> _elementControllers;

  GameSettings _gameSettings;

  Area _area;

  List<ElementController> get elementControllers => List.unmodifiable(_elementControllers);

  AreaController({controllerRepository: ElementControllerRepository, GameSettings gameSettings, area: Area}) {
    _elementControllers = List();
    _gameSettings = gameSettings;
    area.elements.forEach((e) => _elementControllers.add(controllerRepository.getController(e)));
    _elementControllers.sort((controller1, controller2) => controller1.layer.compareTo(controller2.layer));

    //  Find player controller if applicable
    _playerController = _elementControllers.firstWhere((controller) => controller is PlayerController, orElse: ()=>null);
    _area = area;
  }

  AreaContext _getContext() {
    return AreaContext(_area.sizeInTiles);
  }

  void update(double timePassedSeconds) {
    AreaContext context = _getContext();
    _elementControllers.forEach((controller) => controller.update(timePassedSeconds, context));
  }

  Point<double> _getPOVLocationInTiles() {
    if(_playerController != null){
      return Point(_playerController.xTile, _playerController.yTile);
    }
    return Point(0.0 ,0);
  }

  void render(Canvas canvas, Size screenSize) {

    //  Compute the size of the tiles and of the screen
    double tileSize = (screenSize.width > screenSize.height ? screenSize.height : screenSize.width) / _gameSettings.tileWidthsPerScreen;
    double numTilesStackedPerScreen = screenSize.height / tileSize;
    double maxDistanceYFromPOV = numTilesStackedPerScreen / 2;
    double maxDistanceXFromPOV = _gameSettings.tileWidthsPerScreen / 2;

    //  Now compute where in the map to draw!
    Point<double> pov = _getPOVLocationInTiles();
    Iterable<ElementController> toDraw = _elementControllers.where((controller) {
      if((controller.xTile - pov.x).abs() > (maxDistanceXFromPOV + 0.5)) {
        return false;
      }
      if((controller.yTile - pov.y).abs() > (maxDistanceYFromPOV + 0.5)) {
        return false;
      }
      return true;
    });

    //  Now compute where to draw everything on the screen
    double topCornerX = (pov.x - (maxDistanceXFromPOV - 0.5));  //  Extend out half a tile so the POV is always center of screen!
    double topCornerY = pov.y - maxDistanceYFromPOV;

    toDraw.forEach((controller) {

      double x = (controller.xTile - topCornerX) * tileSize;
      double y = (controller.yTile - topCornerY) * tileSize;
      Rect characterRect = Rect.fromLTWH(x, y, tileSize, tileSize);
      controller.draw(characterRect, canvas);

    });
  }

  /// Set the direction the player his selected from the D-Pad
  void updateDirection(Direction direction) {
    if(_playerController != null){
      _playerController.updateDirection(direction);
    }
  }
}