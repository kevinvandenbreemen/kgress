import 'package:kevin_gamify/game/controller/element_controllers.dart';
import 'package:kevin_gamify/game/elements/element.dart';
import 'package:kevin_gamify/game/elements/element_kinds.dart';

class DefaultElementControllersRepository with ElementControllerRepository {

  @override
  ElementController getController(Element element) {
    if(element.kind is StationaryObjectKind) {

    }
  }

}