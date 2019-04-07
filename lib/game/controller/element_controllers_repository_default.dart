import 'package:kevin_gamify/game/controller/element_controllers.dart';
import 'package:kevin_gamify/game/elements/element.dart';
import 'package:kevin_gamify/game/elements/element_kinds.dart';
import 'package:kevin_gamify/game/elements/element_types.dart';
import 'package:kevin_gamify/game/imagesets/element_drawers.dart';

class DefaultElementControllersRepository with ElementControllerRepository {

  ElementDrawerRepository _elementDrawerRepository;

  DefaultElementControllersRepository(this._elementDrawerRepository);

  @override
  ElementController getController(Element element) {
    if(element.kind is StationaryObjectKind) {
      return StationaryElementController(element, _elementDrawerRepository);
    }
    else if (element.kind.elementType == playerCharacter) {
      return PlayerController(element, _elementDrawerRepository);
    }
  }

}