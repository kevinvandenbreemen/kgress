import 'dart:math';
import 'dart:ui';

import 'package:kevin_gamify/game/areas/model/Area.dart';
import 'package:kevin_gamify/game/cartridge/GameCartridge.dart';
import 'package:kevin_gamify/game/controller/element_controllers.dart';

class AreaController {

  List<ElementController> _elementControllers;

  GameSettings _gameSettings;

  List<ElementController> get elementControllers => List.unmodifiable(_elementControllers);

  AreaController({controllerRepository: ElementControllerRepository, GameSettings gameSettings, area: Area}) {
    _elementControllers = List();
    _gameSettings = gameSettings;
    area.elements.forEach((e) => _elementControllers.add(controllerRepository.getController(e)));
  }

  void update(double timePassedSeconds) {
    _elementControllers.forEach((controller) => controller.update(timePassedSeconds));
  }

  Point<double> _getPOVLocationInTiles() {
    return Point(0 ,0);
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
      if((controller.xTile - pov.x).abs() > maxDistanceXFromPOV) {
        return false;
      }
      if((controller.yTile - pov.y).abs() > maxDistanceYFromPOV) {
        return false;
      }
      return true;
    });

    //  Now compute where to draw everything on the screen
    double topCornerX = pov.x - maxDistanceXFromPOV;
    double topCornerY = pov.y - maxDistanceYFromPOV;

    toDraw.forEach((controller) {

      double x = (controller.xTile - topCornerX) * tileSize;
      double y = (controller.yTile - topCornerY) * tileSize;
      Rect characterRect = Rect.fromLTWH(x, y, tileSize, tileSize);
      controller.draw(characterRect, canvas);

    });
  }
}