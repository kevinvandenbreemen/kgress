import 'package:kevin_gamify/game/actions/builtin/element_actions/action_move.dart';
import 'package:kevin_gamify/game/actions/element_action_set.dart';
import 'package:kevin_gamify/game/components/Direction.dart';
import 'package:kevin_gamify/game/controller/area_context.dart';
import 'package:kevin_gamify/game/controller/element_controllers.dart';
import 'package:kevin_gamify/game/elements/element.dart';
import 'package:kevin_gamify/game/states/states.dart';
import 'package:test/test.dart';

import '../element/mock_element_kind.dart';
import '../mock_game_model.dart';
import 'ElementController_test.dart';

void main() {



  group("Acting", () {

    Element element;

    setUp(() {
      element = Element(MockElementKind());
    });

    test("Detects Direction Change", () {

      ElementActionSet actionSet = ElementActionSet(element, [
        Move(Direction.left, 1)
      ]);

      ActorController controller = ActorController(element, MockElementDrawerRepository(), MockGameModel(), actionSet);
      controller.onUpdate(1, element, AreaContext(1));

      expect(element.state, equals(movingLeft));

    });

  });

}