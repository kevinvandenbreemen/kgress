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

  void render(Canvas canvas, double screenWidth) {

    //  Compute where to draw!
    double tileWidth = screenWidth / _gameSettings.tileWidthsPerScreen;

    _elementControllers.forEach((controller) {

      double x = controller.xTile * tileWidth;
      double y = controller.yTile * tileWidth;
      Rect characterRect = Rect.fromLTWH(x, y, screenWidth / _gameSettings.tileWidthsPerScreen, screenWidth / _gameSettings.tileWidthsPerScreen);
      controller.draw(characterRect, canvas);

    });
  }
}