import 'package:kevin_gamify/game/areas/model/Area.dart';
import 'package:kevin_gamify/game/controller/element_controllers.dart';

class AreaController {

  List<ElementController> _elementControllers;

  List<ElementController> get elementControllers => List.unmodifiable(_elementControllers);

  AreaController({controllerRepository: ElementControllerRepository, area: Area}) {
    _elementControllers = List();
    area.elements.forEach((e) => _elementControllers.add(controllerRepository.getController(e)));
  }

  void update(double timePassedSeconds) {
    _elementControllers.forEach((controller) => controller.update(timePassedSeconds));
  }
}