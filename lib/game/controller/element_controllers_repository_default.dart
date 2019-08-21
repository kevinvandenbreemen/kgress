import 'package:kgress/game/GameWorldBridge.dart';
import 'package:kgress/game/actions/element_action_set.dart';
import 'package:kgress/game/controller/element_controllers.dart';
import 'package:kgress/game/elements/element.dart';
import 'package:kgress/game/elements/element_kinds.dart';
import 'package:kgress/game/elements/element_types.dart';
import 'package:kgress/game/imagesets/element_drawers.dart';
import 'package:kgress/game/tools/designer/tools_element_controller_repo.dart';

class DefaultElementControllersRepository with ElementControllerRepository {

  ToolsElementControllerRepository _toolsElementControllerRepository;

  ElementDrawerRepository _elementDrawerRepository;

  GameWorldBridge gameWorld;

  DefaultElementControllersRepository(this._elementDrawerRepository, {GameWorldBridge gameWorldBridge}) {
    this._toolsElementControllerRepository = ToolsElementControllerRepository();
    if(gameWorldBridge == null) {
      this.gameWorld = DummyGameWorldBridge();
    } else {
      this.gameWorld = gameWorldBridge;
    }
  }

  @override
  ElementController getController(Element element) {

    if(element.actions.isPresent) {
      return ActorController(element, _elementDrawerRepository, gameWorld, ElementActionSet(element, element.actions.value));
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