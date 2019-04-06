import 'package:kevin_gamify/game/controller/element_controllers.dart';
import 'package:kevin_gamify/game/elements/element.dart';
import 'package:kevin_gamify/game/elements/element_kinds.dart';
import 'package:kevin_gamify/game/imagesets/element_drawers.dart';

class DefaultElementControllersRepository with ElementControllerRepository {

  ElementDrawerRepository _elementDrawerRepository = DefaultElementDrawerRepository();

  DefaultElementControllersRepository({ElementDrawerRepository elementDrawersRepository}) {
    if(elementDrawersRepository != null){
      this._elementDrawerRepository = elementDrawersRepository;
    }
  }

  @override
  ElementController getController(Element element) {
    if(element.kind is StationaryObjectKind) {
      return StationaryElementController(element, _elementDrawerRepository);
    }
  }

}