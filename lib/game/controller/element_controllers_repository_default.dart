import 'package:kevin_gamify/game/GameWorldBridge.dart';
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

  GameWorldBridge _gameWorld;

  DefaultElementControllersRepository(this._elementDrawerRepository, {GameWorldBridge gameWorldBridge}) {
    this._toolsElementControllerRepository = ToolsElementControllerRepository();
    if(gameWorldBridge == null) {
      this._gameWorld = DummyGameWorldBridge();
    } else {
      this._gameWorld = gameWorldBridge;
    }
  }

  @override
  ElementController getController(Element element) {

    if(element.actions.isPresent) {
      return ActorController(element, _elementDrawerRepository, _gameWorld, ElementActionSet(element, element.actions.value));
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