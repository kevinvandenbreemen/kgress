import 'package:kgress/game/controller/element_controllers.dart';
import 'package:kgress/game/elements/element.dart';
import 'package:kgress/game/tools/designer/game_designer_character.dart';

class ToolsElementControllerRepository with ElementControllerRepository {

  @override
  ElementController getController(Element element) {
    if(element.kind == gameDesignerCharacter) {
      return PlayerController(
        element, GameToolsDrawerRepository()
      );
    }
    return null;
  }

}