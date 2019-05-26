import 'package:kevin_gamify/game/actions/builtin/control_actions.dart';
import 'package:kevin_gamify/game/actions/builtin/element_actions/action_move.dart';
import 'package:kevin_gamify/game/actions/builtin/events.dart';
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
import 'test_actor_controller.dart';

void main() {



  group("Acting", () {

    Element element;

    setUp(() {
      element = Element(MockElementKind());
    });

    test("Detects Direction Change", () {

      element.locXinTiles = 2;
      ElementActionSet actionSet = ElementActionSet(element, [
        Move(Direction.left, 1)
      ]);

      ActorController controller = ActorController(element, MockElementDrawerRepository(), MockGameModel(), actionSet);
      controller.onUpdate(1, element, AreaContext(10));

      expect(element.state, equals(movingLeft));

    });

    test("Processes Collisions", () {
      ElementActionSet actionSet = ElementActionSet(element, [
        LabelAction("Start"),
        On(Events.collide, Goto("Back")),
        Move(Direction.left, 1),
        LabelAction("Back"),
        Move(Direction.right, 1),
      ]);

      TestActorController controller = TestActorController(element, MockElementDrawerRepository(), MockGameModel(), actionSet);
      controller.onUpdate(1, element, AreaContext(1));
      controller.onUpdate(1, element, AreaContext(1));
      controller.onUpdate(1, element, AreaContext(1));

      expect(element.state, equals(movingLeft));
      controller.simulateCollision = true;

      controller.onUpdate(1, element, AreaContext(1));

      controller.simulateCollision = false;

      controller.onUpdate(1, element, AreaContext(1));
      controller.onUpdate(1, element, AreaContext(1));  //  Actually make the movement now!
      expect(element.state, equals(movingRight));

    });

    test("Checks if movement allowed in area before moving", () {
      ElementActionSet actionSet = ElementActionSet(element, [
        LabelAction("Start"),
        On(Events.collide, Goto("Back")),
        Move(Direction.left, 1),
        LabelAction("Back"),
        Move(Direction.right, 1),
      ]);

      TestActorController controller = TestActorController(element, MockElementDrawerRepository(), MockGameModel(), actionSet);
      controller.onUpdate(1, element, AreaContext(10));
      controller.onUpdate(1, element, AreaContext(10));
      controller.onUpdate(1, element, AreaContext(10));

      expect(element.state, equals(movingLeft));
      controller.simulateCanMove = false;

      controller.onUpdate(1, element, AreaContext(1));

      controller.simulateCanMove = true;

      controller.onUpdate(1, element, AreaContext(1));
      controller.onUpdate(1, element, AreaContext(1));  //  Actually make the movement now!
      expect(element.state, equals(movingRight));
    });

  });

}