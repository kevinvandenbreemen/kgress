import 'package:kevin_gamify/game/actions/element_action_set.dart';
import 'package:kevin_gamify/game/controller/element_controllers.dart';
import 'package:kevin_gamify/game/elements/element.dart';
import 'package:kevin_gamify/game/elements/element_kinds.dart';
import 'package:kevin_gamify/game/elements/element_types.dart';
import 'package:kevin_gamify/game/imagesets/element_drawers.dart';
import 'package:kevin_gamify/game/tools/designer/tools_element_controller_repo.dart';

class DefaultElementControllersRepository with ElementControllerRepository {

  ToolsElementControllerRepository _toolsElementControllerRepository;

  ElementDrawerRepository _elementDrawerRepository;

  DefaultElementControllersRepository(this._elementDrawerRepository) {
    this._toolsElementControllerRepository = ToolsElementControllerRepository();
  }

  @override
  ElementController getController(Element element) {

    if(element.actionSet.isPresent) {
      return ActorController(element, _elementDrawerRepository, null, ElementActionSet(element, element.actionSet.value.actions));
    }
    
    ElementController ret = _toolsElementControllerRepository.getController(element);
    if(ret != null) {
      return ret;
    }

    if(element.kind is StationaryObjectKind) {
      return StationaryElementController(element, _elementDrawerRepository);
    }
    else if (element.kind.elementType == playerCharacter) {
      return PlayerController(element, _elementDrawerRepository);
    }
  }

}